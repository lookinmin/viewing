import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:flutter/material.dart';

class Map extends StatelessWidget {
  const Map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: KakaoMapTest(),
    );
  }
}

const String kakaoMapKey = '404f1420684b6d045bcf36049efc3842';

class KakaoMapTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // KakaoMapView
            KakaoMapView(
                width: size.width,
                height: 200,
                kakaoMapKey: kakaoMapKey,
                lat: 33.450701,
                lng: 126.570667,
                showMapTypeControl: true,
                showZoomControl: true,
                markerImageURL:
                    'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
                onTapMarker: (message) async {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Marker is clicked')));

                  //await _openKakaoMapScreen(context);
                }),
          ],
        ),
    );
  }


}
