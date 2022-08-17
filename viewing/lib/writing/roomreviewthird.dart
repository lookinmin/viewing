import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ChipItem {
  Color color;
  Icon icon;
  String string;
  int num;
  bool clicked = false;
  ChipItem(this.color, this.icon, this.string, this.num);
}

class RoomReviewThird extends StatefulWidget {
  const RoomReviewThird({Key? key}) : super(key: key);

  @override
  State<RoomReviewThird> createState() => _RoomReviewThirdState();
}

class _RoomReviewThirdState extends State<RoomReviewThird> {
  List chipGood = [
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.close), '없음', 0),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.directions_car),
        '주차',
        1),
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.commute), '대중교통', 2),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.nature_people),
        '공원산책',
        3),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.local_police),
        '치안',
        4),
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.security), '경비실', 5),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.construction),
        '건물관리',
        6),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.recycling),
        '분리수거',
        7),
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.air), '환기', 8),
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.water_drop), '결로', 9),
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.fireplace), '단열', 10),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.pets),
        '반려동물 키우기',
        11),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.bug_report),
        '방충',
        12),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.hearing_disabled),
        '층간소음',
        13),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.elevator),
        '엘레베이터',
        14),
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.hearing), '주변소음', 15),
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.bus_alert), '평지', 16),
    ChipItem(
        Colors.black,
        Icon(
            color: Color.fromRGBO(248, 180, 0, 1),
            Icons.local_convenience_store),
        '편의시설',
        17),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.storefront),
        '상가',
        18),
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.school), '학군', 19),
  ];
  List chipBad = [
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.close), '없음', 0),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.directions_car),
        '주차',
        1),
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.commute), '대중교통', 2),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.nature_people),
        '공원산책',
        3),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.local_police),
        '치안',
        4),
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.security), '경비실', 5),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.construction),
        '건물관리',
        6),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.recycling),
        '분리수거',
        7),
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.air), '환기', 8),
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.water_drop), '결로', 9),
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.fireplace), '단열', 10),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.pets),
        '반려동물 키우기',
        11),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.bug_report),
        '방충',
        12),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.hearing_disabled),
        '층간소음',
        13),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.elevator),
        '엘레베이터',
        14),
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.hearing), '주변소음', 15),
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.bus_alert), '평지', 16),
    ChipItem(
        Colors.black,
        Icon(
            color: Color.fromRGBO(248, 180, 0, 1),
            Icons.local_convenience_store),
        '편의시설',
        17),
    ChipItem(
        Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.storefront),
        '상가',
        18),
    ChipItem(Colors.black,
        Icon(color: Color.fromRGBO(248, 180, 0, 1), Icons.school), '학군', 19),
  ];

  int cntGood = 0;
  int cntBad = 0;

  String text = "보통이에요";
  Icon icon = Icon(Icons.sentiment_neutral, color: Colors.yellow);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          '리뷰쓰기(평점)',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        )),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 191, 190, 190)),
              )),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Text('서원구 충대로1에 대해\n평가해주세요',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 20)),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.error,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            '리뷰 작성자의 익명성은 100% 보장됩니다.',
                            style: TextStyle(
                                color: Color.fromARGB(255, 117, 117, 117)),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            writeReview(context, '장점'),
            selectKeywords('장점', chipGood),
            writeReview(context, "단점"),
            selectKeywords("단점", chipBad)
          ],
        ),
      ),
      bottomNavigationBar: bottomModal(context),
    );
  }

  Container bottomModal(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(255, 99, 99, 1),
          ),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              builder: (BuildContext context) {
                return StatefulBuilder(
                    builder: (BuildContext context, setState) => SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: Column(
                            children: <Widget>[
                              //상단 x 버튼
                              Flexible(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Expanded(child: Container()),
                                    IconButton(
                                      icon: Icon(
                                        Icons.close_rounded,
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Text(
                                  '훌륭해요!\n당신이 생각하는 이 곳의 만족도는?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Flexible(
                                flex: 4,
                                child: ratingBox(context, setState),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color.fromRGBO(255, 99, 99, 1),
                                      ),
                                      onPressed: () {
                                        print('btnClick');
                                      },
                                      child: Text('확인')),
                                ),
                              ),
                            ],
                          ),
                        ));
              },
            ).then((value) {
              setState(() {});
            });
          },
          child: Text('다음')),
    );
  }

  Container ratingBox(BuildContext context, StateSetter setState) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          color: Color(0xfffaf5e4), borderRadius: BorderRadius.circular(15)),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
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
                      icon =
                          Icon(Icons.sentiment_dissatisfied, color: Colors.red);
                    } else if (rating <= 3) {
                      text = "보통이에요";
                      icon =
                          Icon(Icons.sentiment_neutral, color: Colors.yellow);
                    } else if (rating <= 4) {
                      text = "만족해요";
                      icon =
                          Icon(Icons.sentiment_satisfied, color: Colors.green);
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
          ),
          Flexible(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 5), child: Text(text)),
                      icon
                    ]),
              )),
        ],
      ),
    );
  }

  Container selectKeywords(String s, List chipGood) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '$s 키워드를 선택해 주세요',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    choiceChip(chipGood[0], s),
                    choiceChip(chipGood[1], s),
                    choiceChip(chipGood[2], s),
                    choiceChip(chipGood[3], s),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    choiceChip(chipGood[4], s),
                    choiceChip(chipGood[5], s),
                    choiceChip(chipGood[6], s),
                    choiceChip(chipGood[7], s),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    choiceChip(chipGood[8], s),
                    choiceChip(chipGood[9], s),
                    choiceChip(chipGood[10], s),
                    choiceChip(chipGood[11], s),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    choiceChip(chipGood[12], s),
                    choiceChip(chipGood[13], s),
                    choiceChip(chipGood[14], s),
                    choiceChip(chipGood[15], s),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    choiceChip(chipGood[16], s),
                    choiceChip(chipGood[17], s),
                    choiceChip(chipGood[18], s),
                    choiceChip(chipGood[19], s),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  ChoiceChip choiceChip(chipSelect, String s) {
    return ChoiceChip(
      avatar: chipSelect.icon,
      label: Text(
        chipSelect.string,
        style: TextStyle(
            fontSize: 10,
            color: chipSelect.color == Colors.lightBlue
                ? Colors.white
                : Colors.black),
      ),
      selectedColor: Color.fromRGBO(255, 99, 99, 1),
      onSelected: (bool value) {
        setState(() {
          chipSelect.clicked = !chipSelect.clicked;
          chipSelect.color = chipSelect.clicked
              ? Colors.lightBlue
              : Color.fromRGBO(255, 99, 99, 1);

          print(chipSelect.clicked);
        });
      },
      //지금 clicked가 true이면 cntgood++, false이면 cntbad-- -> 이걸 장점 단점일 때 나눠서 생각
      selected: chipSelect.color == Colors.lightBlue,
    );
  }

  Container writeReview(BuildContext context, String s) {
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
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
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
}
