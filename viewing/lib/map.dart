import 'dart:convert';

import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:flutter/material.dart';
import 'package:viewing/roomInfo/room.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

const String kakaoMapKey = '404f1420684b6d045bcf36049efc3842';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  WebViewController? _mapController;
  int zoom = 5;
  bool flag = true;
  Position? user_pos;
  int customZoom = 3;
  var address = [];
  bool invislble = true;

  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    user_pos = position;

    return position;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
    address.add({'lat': 36.624329, 'lng': 127.457268});
    address.add({'lat': 36.620612, 'lng': 127.435182});
    address.add({'lat': 36.635594, 'lng': 127.441524});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Container(
            child: KakaoMapView(
              mapController: (controller) {
                _mapController = controller;
              },
              zoomLevel: zoom,
              width: size.width,
              height: size.height - 56 - 88.6,
              kakaoMapKey: kakaoMapKey,
              lat: 36.624329,
              lng: 127.457268,
              customOverlayStyle: '''
<style>
.box {
                display: flex;
                flex-direction: column;
                position: absolute;
                width: 160px;
                height: 100px;
                left:-80px;
                top:-50px;
                background: #FFFFFF;
                border: 2px solid #FF6363;
                box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
                border-radius: 10px;
                font-size : 12px
            }
            .address {
                text-align: center;
                border-bottom: 2px solid #FF6363;
                width: 140px;
                margin: 0px 10px;
                flex-grow: 1;
            }
            .content{
                display: flex;
                flex-direction: column;
                flex-grow: 6;
                justify-content: space-between;
            }
            .fee{
                padding: 3px 8px ;
                display: flex;
                justify-content: space-between;
            }
            .review{
                width: 20px;
                height: 20px;
                border-radius: 50%;
                border: solid red 1px;
                color: #ffffff;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 12px;
                background-color: #FF6363;
            }   


</style>
                    ''',
              customOverlay: '''
                var overlays=[]

                function temp(e) {
                  onTapMarker.postMessage('overlay '+e.id);
                }
                function temp2(e) {
                  onTapMarker.postMessage('review '+e.id);
                }
                function addOverlay(name,position,id) {
                  var content = 
                  '<div id="'+id+'" class="box" onclick="temp(this)">'+
                      '<div class="address"><span class="title">'+name+'</span></div>'+
                      '<div class="content">'+
                          '<div class="fee"><span>보증금 :</span><span>300</span><span>만원</span></div>'+
                          '<div class="fee"><span>월세 :</span><span>30</span><span>만원</span></div>'+
                          '<div class="fee"><span>관리비 :</span><span>10</span><span>만원</span></div>'+
                      '</div>'+
                  '</div>';
                  let customOverlay = new kakao.maps.CustomOverlay({
                    position: position,
                    content: content,
                    yAnchor: 1
                  });
                  overlays.push(customOverlay);
                  customOverlay.setMap(map);
                };
                function addViewOverlay(num,position,id){
                  var content = 
                  '<div id="'+id+'" class="review" onclick="temp2(this)">'+num+'</div>';
                  let customOverlay = new kakao.maps.CustomOverlay({
                    position: position,
                    content: content,
                    yAnchor: 1
                  });
                  overlays.push(customOverlay);
                  customOverlay.setMap(map);
                }
                function setCenter(position) {            
                  map.setCenter(position);
                }
                kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
            
                  // 클릭한 위도, 경도 정보를 가져옵니다 
                  // var latlng = mouseEvent.latLng;
                  
                  // var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
                  // message += '경도는 ' + latlng.getLng() + ' 입니다';
                  
                  // var resultDiv = document.getElementById('result'); 
                  // resultDiv.innerHTML = message;
                  onTapMarker.postMessage('onTapMap');
                });
                addOverlay('개신동',new kakao.maps.LatLng(36.624329, 127.457268),0);
                addOverlay('가경동',new kakao.maps.LatLng(36.620612, 127.435182),1);
                addOverlay('복대동',new kakao.maps.LatLng(36.635594, 127.441524),2);
              ''',
              onTapMarker: (message) {
                var temp = message.message.split(' ');
                if (temp[0] == 'overlay') {
                  _mapController?.runJavascript('''
              setCenter(new kakao.maps.LatLng(${address[int.parse(temp[1])]['lat'].toString()}, ${address[int.parse(temp[1])]['lng'].toString()}));
              map.setLevel(4, {animate: false})
                ''');
                } else if (temp[0] == 'review') {
                  print('리뷰눌림');
                  setState(() {
                    invislble = false;
                  });
                } else if (temp[0] == 'onTapMap') {
                  setState(() {
                    invislble = true;
                  });
                }
              },
              zoomChanged: (message) {
                print('current zoom level : ${message.message}');
                zoom = int.parse(message.message.toString());
                int pastZoom = customZoom;
                switch (zoom) {
                  case 1:
                  case 2:
                  case 3:
                  case 4:
                    {
                      customZoom = 2;
                      break;
                    }
                  case 5:
                  case 6:
                  case 7:
                    {
                      customZoom = 3;
                      break;
                    }
                  case 8:
                  case 9:
                    {
                      customZoom = 4;
                      break;
                    }
                  case 10:
                  case 11:
                    {
                      customZoom = 5;
                      break;
                    }
                  default:
                    {
                      customZoom = 6;
                      break;
                    }
                }
                if (customZoom != pastZoom) {
                  if (customZoom == 1) {
                    _mapController?.runJavascript('''
                      overlays.map(tmp=> tmp.setMap(null));
                      overlays=[];
                        ''');
                  } else if (customZoom == 2) {
                    _mapController?.runJavascript('''
                      overlays.map(tmp=> tmp.setMap(null));
                      overlays=[];
                      addViewOverlay(3,new kakao.maps.LatLng(36.626660, 127.449461),0);
                      addViewOverlay(1,new kakao.maps.LatLng(36.626610, 127.339042),1);
                      addViewOverlay(2,new kakao.maps.LatLng(36.626570, 127.450607),2);
                        ''');
                  } else if (customZoom == 3) {
                    _mapController?.runJavascript('''
                      overlays.map(tmp=> tmp.setMap(null));
                      overlays=[];
                      addOverlay('개신동',new kakao.maps.LatLng(36.624329, 127.457268),0);
                      addOverlay('가경동',new kakao.maps.LatLng(36.620612, 127.435182),1);
                      addOverlay('복대동',new kakao.maps.LatLng(36.635594, 127.441524),2);
                       ''');
                    address.clear();
                    address.add({'lat': 36.624329, 'lng': 127.457268});
                    address.add({'lat': 36.620612, 'lng': 127.435182});
                    address.add({'lat': 36.635594, 'lng': 127.441524});
                  } else if (customZoom == 4) {
                    _mapController?.runJavascript('''
                      overlays.map(tmp=> tmp.setMap(null));
                      overlays=[];
                      addOverlay('서원구',new kakao.maps.LatLng(36.5469, 127.4378),0);
                      addOverlay('흥덕구',new kakao.maps.LatLng(36.634850, 127.435109),1);
                      addOverlay('상당구',new kakao.maps.LatLng(36.643017, 127.520900),2);
                       ''');
                    address.clear();
                    address.add({'lat': 36.546900, 'lng': 127.437800});
                    address.add({'lat': 36.634850, 'lng': 127.435109});
                    address.add({'lat': 36.643017, 'lng': 127.520900});
                  } else if (customZoom == 5) {
                    _mapController?.runJavascript('''
                      overlays.map(tmp=> tmp.setMap(null));
                      overlays=[];
                      addOverlay('청주시',new kakao.maps.LatLng(36.644103, 127.482231),0);
                       ''');
                    address.clear();
                    address.add({'lat': 36.644103, 'lng': 127.482231});
                  } else if (customZoom == 6) {}
                }
              },
              cameraIdle: (message) {
                print('카메라 아이들 : ${message.message}');
                if (zoom >= 5 && zoom <= 7) {}
              },
            ),
          ),
          Row(
            //우측 내위치로, 줌레벨 변환 버튼
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0), //or 15.0
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: IconButton(
                        icon: Icon(Icons.my_location,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        onPressed: () {
                          _mapController?.runJavascript(
                              'setCenter(new kakao.maps.LatLng(${user_pos?.latitude.toString()}, ${user_pos?.longitude.toString()}));');
                          json();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0), //or 15.0
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: IconButton(
                        icon: Icon(Icons.add,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        onPressed: () {
                          _mapController?.runJavascript(
                              'map.setLevel(map.getLevel() - 1, {animate: false})');
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0), //or 15.0
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: IconButton(
                        icon: Icon(Icons.remove,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        onPressed: () {
                          _mapController?.runJavascript(
                              'map.setLevel(map.getLevel() + 1, {animate: false})');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Offstage(
                offstage: invislble,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(builder: (context) => Room()),
                      );
                    },
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), //모서리를 둥글게
                          border: Border.all(color: Colors.black12, width: 3),
                          color: Color.fromARGB(255, 255, 255, 255)), //테두리
                      child: Row(
                        children: [
                          Flexible(
                            flex: 5,
                            fit: FlexFit.tight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  //color: Colors.red,
                                  child: Text(
                                    "다솜빌",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "충북 청주시 흥덕구 풍산로178번길 35",
                                  style: TextStyle(
                                      fontSize: 14,
                                      //fontWeight: FontWeight.w800,
                                      color: Colors.grey,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "충북 청주시 흥덕구 복대동 1893",
                                  style: TextStyle(
                                      fontSize: 14,
                                      //fontWeight: FontWeight.w800,
                                      color: Colors.grey,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                              flex: 3,
                              fit: FlexFit.tight,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        ' 4.0',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        ' (리뷰3)',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Color.fromARGB(
                                                255, 255, 154, 59)),
                                      ),
                                    ],
                                  ),
                                  Container(child: setStar(4)),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          flex: 9,
                                          child: InkWell(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Room())),
                                              child: Text(' 클릭해서 리뷰보기',
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 99, 99, 1),
                                                    fontSize: 13,
                                                  ))),
                                        ),
                                        Flexible(
                                            flex: 1,
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 8,
                                              color: Color.fromRGBO(
                                                  255, 99, 99, 1),
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

dynamic json() async {
  var uriResponse = await http.get(
    Uri.parse(
      'https://jsonplaceholder.typicode.com/posts?userId=1',
    ),
  );

  var json = jsonDecode(uriResponse.body);
  return json;
}

Widget setStar(int num) {
  //평균별점 int로 받아서 노란별로 띄우기 응애
  if (num == 1) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Colors.grey),
                Icon(Icons.star, color: Colors.grey),
                Icon(Icons.star, color: Colors.grey),
                Icon(Icons.star, color: Colors.grey),
              ],
            ),
          ],
        )
      ],
    );
  }
  if (num == 2) {
    return Row(
      children: [
        Icon(
          Icons.sentiment_dissatisfied,
          color: Color.fromARGB(255, 255, 154, 59),
          size: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Colors.grey),
                Icon(Icons.star, color: Colors.grey),
                Icon(Icons.star, color: Colors.grey),
              ],
            ),
          ],
        )
      ],
    );
  }
  if (num == 3) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Colors.grey),
                Icon(Icons.star, color: Colors.grey),
              ],
            ),
          ],
        )
      ],
    );
  }
  if (num == 4) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Colors.grey),
              ],
            ),
          ],
        )
      ],
    );
  } else {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
              ],
            ),
          ],
        )
      ],
    );
  }
}
