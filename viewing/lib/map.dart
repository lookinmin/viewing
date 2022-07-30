import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:flutter/material.dart';

const String kakaoMapKey = '404f1420684b6d045bcf36049efc3842';

class Map extends StatelessWidget {
  const Map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: KakaoMapView(
          width: size.width,
          height: 200,
          kakaoMapKey: kakaoMapKey,
          lat: 33.450701,
          lng: 126.570667,
          showZoomControl: true,
          customOverlayStyle: '''<style>
                  .customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
    .customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
    .customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
    .customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
    .customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
                  </style>''',
          customOverlay: '''
    var content = '<div class="customoverlay" onclick="temp()">' +
        '    <span class="title">카카오!</span>' +
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
          }),
    );
  }
}
