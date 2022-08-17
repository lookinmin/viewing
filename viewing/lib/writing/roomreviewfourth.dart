import 'package:flutter/material.dart';
import 'package:viewing/main.dart';

class RoomReviewFourth extends StatefulWidget {
  const RoomReviewFourth({Key? key}) : super(key: key);

  @override
  State<RoomReviewFourth> createState() => _RoomReviewFourthState();
}

class _RoomReviewFourthState extends State<RoomReviewFourth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          '리뷰쓰기(사진첨부)',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        )),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    '방 사진을 공유해주세요!(선택입니다)',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                ),
                Text('마지막으로 공유하고 싶은 사진을 올려주세요!',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey)),
                Text('내가 올린 사진은 다른 이용자들에게\n큰 도움이 됩니다!(최대 10장)',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey)),
                Container(
                  child: Center(
                    child: Text('사진 올리기'),
                  ),
                )
              ],
            ),
          )),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(255, 99, 99, 1),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text('확인')),
      ),
    );
  }
}
