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
  String content = "개신동";
  WebViewController? _mapController;
  int zoom = 5;
  int temp = 0;
  Position? user_pos;

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
        var content = 
        '<div class="box">'+
            '<div class="address"><span class="title">${content}</span></div>'+
            '<div class="content">'+
                '<div class="fee"><span>보증금 :</span><span>300</span><span>만원</span></div>'+
                '<div class="fee"><span>월세 :</span><span>30</span><span>만원</span></div>'+
                '<div class="fee"><span>관리비 :</span><span>10</span><span>만원</span></div>'+
            '</div>'+
        '</div>';

        var position = new kakao.maps.LatLng(36.624329, 127.457268);
        var overlays=[]

        function temp() {
          onTapMarker.postMessage('marker hjhjhjis tapped');
        }
        function addMarker(position) {
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
                if (zoom >= 5 && zoom <= 7) {
                } else {
                  _mapController?.runJavascript(
                      'overlays.map(tmp=> tmp.setMap(null));overlays=[];');
                }
              },
              cameraIdle: (message) {
                print('카메라 아이들 : ${message.message}');
                if (zoom >= 5 && zoom <= 7) {
                  _mapController?.runJavascript('''
              addMarker(new kakao.maps.LatLng(36.624329, 127.457268));
              addMarker(new kakao.maps.LatLng(36.620612, 127.435182));
              addMarker(new kakao.maps.LatLng(36.635594, 127.441524));
                ''');
                }
                temp++;
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
        ],
      ),
    );
  }
}
