import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:flutter/material.dart';

const String kakaoMapKey = '404f1420684b6d045bcf36049efc3842';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Container(
            child: KakaoMapView(
              width: size.width,
              height: size.height,
              kakaoMapKey: kakaoMapKey,
              lat: 33.450701,
              lng: 126.570667,
              showZoomControl: true,
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
        '<div class="address"><span class="title">개신동</span></div>'+
        '<div class="content">'+
            '<div class="fee"><span>보증금 :</span><span>300</span><span>만원</span></div>'+
            '<div class="fee"><span>월세 :</span><span>30</span><span>만원</span></div>'+
            '<div class="fee"><span>관리비 :</span><span>10</span><span>만원</span></div>'+
        '</div>'+
    '</div>';

    var position = new kakao.maps.LatLng(33.450701, 126.570667);

    var customOverlay = new kakao.maps.CustomOverlay({
              map: map,
              position: position,
              content: content,
              yAnchor: 1
    });
    function temp() {
              onTapMarker.postMessage('marker hjhjhjis tapped');
    }
                ''',
              onTapMarker: (message) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message.message)));
              },
              zoomChanged: (message) {
                print('current zoom level : ${message.message}');
              },
              boundaryUpdate: (message) {
                print('current zoom level : ${message.message}');
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => {print("버튼 눌림")},
            child: Text('버튼'),
          ),
        ],
      ),
    );
  }
}
