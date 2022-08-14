import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class RoomReviewThird extends StatefulWidget {
  const RoomReviewThird({Key? key}) : super(key: key);

  @override
  State<RoomReviewThird> createState() => _RoomReviewThirdState();
}

class ChipItem {
  Color color;
  Icon icon;
  String string;
  int num;
  ChipItem(this.color, this.icon, this.string, this.num);
}

class _RoomReviewThirdState extends State<RoomReviewThird> {
  // List chipSelect = <Color>[
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red,
  //   Colors.red
  // ];

  List chipSelect = [
    ChipItem(Colors.black, Icon(Icons.bus_alert), '없음', 0),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '주차', 1),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '대중교통', 2),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '공원산책', 3),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '치안', 4),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '경비실', 5),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '건물관리', 6),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '분리수거', 7),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '환기', 8),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '방습', 9),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '단열', 10),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '반려동물 키우기', 11),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '방충', 12),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '방음', 13),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '엘레베이터', 14),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '소음', 15),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '평지', 16),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '편의시설', 17),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '상가', 18),
    ChipItem(Colors.black, Icon(Icons.bus_alert), '학군', 19),
  ];
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
            good(context),
            goodKeywords()
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
              print('btnClick');
            },
            child: Text('다음')),
      ),
    );
  }

  Column goodKeywords() {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              '장점 키워드를 선택해 주세요 (최대 8개)',
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
                  choiceChip(chipSelect[0]),
                  choiceChip(chipSelect[1]),
                  choiceChip(chipSelect[2]),
                  choiceChip(chipSelect[3]),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  choiceChip(chipSelect[4]),
                  choiceChip(chipSelect[5]),
                  choiceChip(chipSelect[6]),
                  choiceChip(chipSelect[7]),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  choiceChip(chipSelect[8]),
                  choiceChip(chipSelect[9]),
                  choiceChip(chipSelect[10]),
                  choiceChip(chipSelect[11]),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  choiceChip(chipSelect[12]),
                  choiceChip(chipSelect[13]),
                  choiceChip(chipSelect[14]),
                  choiceChip(chipSelect[15]),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  choiceChip(chipSelect[16]),
                  choiceChip(chipSelect[17]),
                  choiceChip(chipSelect[18]),
                  choiceChip(chipSelect[19]),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  ChoiceChip choiceChip(chipSelect) {
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
          chipSelect.color =
              value ? Colors.lightBlue : Color.fromRGBO(255, 99, 99, 1);
        });
      },
      selected: chipSelect.color == Colors.lightBlue,
    );
  }

  Container good(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              '장점 (50자 이상)',
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
                  hintText: '우리 집의 장점을 이야기해주세요'),
            ),
          ),
        ],
      ),
    );
  }
}
