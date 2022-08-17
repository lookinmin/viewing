import 'package:flutter/material.dart';
import 'package:viewing/startpage/login_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetologin();
  }

  _navigatetologin() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 99, 99, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.22),
            Image.asset(
              'assets/images/logo2-5white.png', //종원아 경로 assets부터 하니까 이미지오류떠 힝-> 해결
              height: screenWidth * 0.5,
              width: screenHeight * 0.5,
            ),
            Flexible(
                flex: 3,
                child: SizedBox(
                  height: 200,
                )),
            Flexible(
                flex: 1,
                child: Text(
                  "© Copyright 2022, 뷰잉(VIEWING)",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
