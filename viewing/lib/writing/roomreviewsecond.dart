import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:viewing/main.dart';

class RoomReviewSecond extends StatefulWidget {
  const RoomReviewSecond({Key? key}) : super(key: key);

  @override
  State<RoomReviewSecond> createState() => _RoomReviewSecondState();
}

class _RoomReviewSecondState extends State<RoomReviewSecond> {
  String text = "보통이에요";
  Icon icon = Icon(Icons.sentiment_neutral, color: Colors.yellow);
  final goodText = TextEditingController();
  final badText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          '리뷰쓰기',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        )),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            ratingBar(),
            goodOrBad(context, '장점', goodText),
            goodOrBad(context, '단점', badText),
            SizedBox(
              height: 200,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      '사진을 올려주세요(선택)',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(8),
                    strokeWidth: 3,
                    color: Color.fromARGB(255, 221, 221, 221),
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Center(
                          child: Icon(
                        Icons.add_a_photo,
                        size: 40,
                        color: Colors.blue,
                      )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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
            child: Text('작성완료')),
      ),
    );
  }

  Container goodOrBad(
      BuildContext context, String s, TextEditingController textCtrl) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              '$s (50자 이상)',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 221, 221),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              maxLines: 5,
              maxLength: 1000,
              controller: textCtrl,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none, //검색 아이콘 추가
                  contentPadding:
                      EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 5),
                  hintText: '우리 집의 $s을 이야기해주세요'),
            ),
          ),
        ],
      ),
    );
  }

  Container ratingBar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                '청주시 서원구 충대로 1에 대한 별점을 매겨주세요',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              )),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 221, 221),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        if (rating <= 1) {
                          text = "최악이에요";
                          icon = Icon(
                            Icons.sentiment_very_dissatisfied,
                            color: Colors.black,
                          );
                        } else if (rating <= 2) {
                          text = "별로예요";
                          icon = Icon(Icons.sentiment_dissatisfied,
                              color: Colors.red);
                        } else if (rating <= 3) {
                          text = "보통이에요";
                          icon = Icon(Icons.sentiment_neutral,
                              color: Colors.yellow);
                        } else if (rating <= 4) {
                          text = "만족해요";
                          icon = Icon(Icons.sentiment_satisfied,
                              color: Colors.green);
                        } else {
                          text = "아주 좋아요";
                          icon = Icon(
                            Icons.sentiment_very_satisfied,
                            color: Colors.blue,
                          );
                        }
                      });
                    },
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      margin: EdgeInsets.only(right: 5), child: Text(text)),
                  icon
                ]),
              ],
            ),
          ),
          //
        ],
      ),
    );
  }
}
