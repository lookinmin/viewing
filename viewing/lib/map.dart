import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:geolocator/geolocator.dart';

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
  int customZoom=3;

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
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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


</style>
                    ''',
              customOverlay: '''
        var overlays=[]

        function temp(e) {
          onTapMarker.postMessage('overlay '+e.id+' tapped');
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
        }
        function setCenter(position) {            
          map.setCenter(position);
        }
                    ''',
              onTapMarker: (message) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message.message)));
              },
              zoomChanged: (message) {
                print('current zoom level : ${message.message}');
                zoom = int.parse(message.message.toString());
                int pastZoom=customZoom;
                switch (zoom){
                  case 1:
                  case 2:
                  case 3:{
                    customZoom=1;
                    break;
                  }
                  case 4:{
                    customZoom=2;
                    break;
                  }
                  case 5:
                  case 6:
                  case 7:{
                    customZoom=3;
                    break;
                  }
                  case 8:
                  case 9:{
                    customZoom=4;
                    break;
                  }
                  case 10:
                  case 11:{
                    customZoom=5;
                    break;
                  }
                  case 12:{
                    customZoom=6;
                    break;
                  }
                  default:{
                    customZoom=6;
                    _mapController?.runJavascript(
                              'map.setLevel(12, {animate: false})');
                    break;
                  }
                }
                if(customZoom!=pastZoom){
                  if (customZoom==3) {
                    _mapController?.runJavascript('''
              overlays.map(tmp=> tmp.setMap(null));
              overlays=[];
              addOverlay('개신동',new kakao.maps.LatLng(36.624329, 127.457268),1);
              addOverlay('가경동',new kakao.maps.LatLng(36.620612, 127.435182),2);
              addOverlay('복대동',new kakao.maps.LatLng(36.635594, 127.441524),3);
                ''');
                  }
                  else if(customZoom==4){
                    _mapController?.runJavascript('''
              overlays.map(tmp=> tmp.setMap(null));
              overlays=[];
              addOverlay('서원구',new kakao.maps.LatLng(36.5469, 127.4378),4);
              addOverlay('흥덕구',new kakao.maps.LatLng(36.634850, 127.435109),5);
              addOverlay('상당구',new kakao.maps.LatLng(36.643017, 127.520900),6);
                ''');
                  } 
                  else if(customZoom==5){
                    _mapController?.runJavascript('''
              overlays.map(tmp=> tmp.setMap(null));
              overlays=[];
              addOverlay('청주시',new kakao.maps.LatLng(36.644103, 127.482231),7);
              
                ''');
                  }
                  else if(customZoom==6){

                  }
                }
                
              },
              cameraIdle: (message) {
                print('카메라 아이들 : ${message.message}');
                if (zoom >= 5 && zoom <= 7) {
                 
                }
              },
            ),
          ),
          Row(//우측 내위치로, 줌레벨 변환 버튼
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
                        icon: Icon(Icons.add, color: Color.fromARGB(255, 0, 0, 0)),
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
                        icon:
                            Icon(Icons.remove, color: Color.fromARGB(255, 0, 0, 0)),
                        onPressed: () {
                          if (zoom < 13) {
                            _mapController?.runJavascript(
                              'map.setLevel(map.getLevel() + 1, {animate: false})');
                              }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
