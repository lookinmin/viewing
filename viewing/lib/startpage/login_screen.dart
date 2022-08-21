import 'package:flutter/material.dart';
import 'package:viewing/mainpage/home.dart';
import 'package:viewing/main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 220, 50, 0),
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '"리뷰를 보다"',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    letterSpacing: 0.0,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '뷰잉(VIEWING)',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 99, 99, 1),
                      fontSize: 30,
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                // Text(
                //   '"리뷰를 보다"',
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 16,
                //     letterSpacing: 0.0,
                //   ),
                // ),
                Text(
                  ' 실거주자들의 리뷰 공유 플랫폼',
                  style: TextStyle(
                    color: Color.fromRGBO(65, 63, 66, 1),
                    fontSize: 16,
                    letterSpacing: 0.0,
                  ),
                ),
                // SizedBox(
                //     height: 190,
                //     child: Container(
                //         // color: Colors.red,
                //         )),
                // SizedBox(
                //   height: screenHeight * 0.02,
                // ),
                // Image.asset(
                //   '/images/logo_pink.png', //종원아 경로 assets부터 하니까 이미지오류떠 힝
                //   height: screenWidth * 0.5,
                //   width: screenHeight * 0.5,
                // ),
                SizedBox(
                  height: screenHeight * 0.30,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Image.asset('assets/images/kakao_login_large_Kor.png'),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Center(
                  child: Text(
                    '가입하면 당사의 서비스 약관에 동의하고',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '개인정보 보호정책을(를) 읽어 당사의 데이터 수집,',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '사용, 공유방법을 확인했음을 인정하는 것입니다.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
