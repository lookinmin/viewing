import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:viewing/writing/roomreviewthird.dart';

class RoomReviewSecond extends StatefulWidget {
  const RoomReviewSecond({Key? key}) : super(key: key);

  @override
  State<RoomReviewSecond> createState() => _RoomReviewSecondState();
}

class _RoomReviewSecondState extends State<RoomReviewSecond> {
  var isSelected1 = [false, false, false, false, false];
  var isSelected2 = [false, false, false, false, false];
  var isSelected3 = [false, false, false, false, false];
  var isSelected4 = [false, false, false, false, false];
  var isSelected5 = [false, false, false, false, false];
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
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 191, 190, 190)),
              )),
              child: Text('서원구 충대로1에 대해\n평가해주세요',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 20)),
            ),
            transportRate(),
            buildingRate(),
            aroundRate(),
            indoorRate(),
            infraRate(),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RoomReviewThird()));
            },
            child: Text('다음')),
      ),
    );
  }

  SizedBox infraRate() {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Text('생활 및 입지 점수',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18)),
          Text('학군 식당, 카페, 마트 등 인프라가 잘 갖추어져 있나요?',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
          Container(
            height: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ToggleButtons(
                    renderBorder: false,
                    selectedColor: Color.fromRGBO(255, 99, 99, 1),
                    focusColor: Color.fromRGBO(255, 99, 99, 1),
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < isSelected5.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            isSelected5[buttonIndex] = true;
                          } else {
                            isSelected5[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    isSelected: isSelected5,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_very_dissatisfied_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_dissatisfied_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_neutral_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_satisfied_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_very_satisfied_outlined,
                          size: 40,
                        ),
                      )
                    ],
                  )
                ]),
          )
        ],
      ),
    );
  }

  SizedBox indoorRate() {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Text('내부 점수',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18)),
          Text('채광, 환기, 수납, 방음 등에 만족하시나요?',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
          Container(
            height: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ToggleButtons(
                    renderBorder: false,
                    selectedColor: Color.fromRGBO(255, 99, 99, 1),
                    focusColor: Color.fromRGBO(255, 99, 99, 1),
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < isSelected4.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            isSelected4[buttonIndex] = true;
                          } else {
                            isSelected4[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    isSelected: isSelected4,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_very_dissatisfied_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_dissatisfied_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_neutral_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_satisfied_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_very_satisfied_outlined,
                          size: 40,
                        ),
                      )
                    ],
                  )
                ]),
          )
        ],
      ),
    );
  }

  SizedBox aroundRate() {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Text('주변 및 환경 점수',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18)),
          Text('치안, 공원 및 자연환경 등에 만족하시나요?',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
          Container(
            height: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ToggleButtons(
                    renderBorder: false,
                    selectedColor: Color.fromRGBO(255, 99, 99, 1),
                    focusColor: Color.fromRGBO(255, 99, 99, 1),
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < isSelected3.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            isSelected3[buttonIndex] = true;
                          } else {
                            isSelected3[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    isSelected: isSelected3,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_very_dissatisfied_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_dissatisfied_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_neutral_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_satisfied_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_very_satisfied_outlined,
                          size: 40,
                        ),
                      )
                    ],
                  )
                ]),
          )
        ],
      ),
    );
  }

  SizedBox buildingRate() {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Text('건물 및 단지 점수',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18)),
          Text('주차나 보안, 부대시설 등에 만족하시나요?',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
          Container(
            height: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ToggleButtons(
                    renderBorder: false,
                    selectedColor: Color.fromRGBO(255, 99, 99, 1),
                    focusColor: Color.fromRGBO(255, 99, 99, 1),
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < isSelected2.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            isSelected2[buttonIndex] = true;
                          } else {
                            isSelected2[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    isSelected: isSelected2,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_very_dissatisfied_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_dissatisfied_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_neutral_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_satisfied_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_very_satisfied_outlined,
                          size: 40,
                        ),
                      )
                    ],
                  )
                ]),
          )
        ],
      ),
    );
  }

  SizedBox transportRate() {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Text('교통점수',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18)),
          Text('버스, 지하철 등 교통수단 이용이 편리한가요?',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
          Container(
            height: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ToggleButtons(
                    renderBorder: false,
                    selectedColor: Color.fromRGBO(255, 99, 99, 1),
                    focusColor: Color.fromRGBO(255, 99, 99, 1),
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < isSelected1.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            isSelected1[buttonIndex] = true;
                          } else {
                            isSelected1[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    isSelected: isSelected1,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_very_dissatisfied_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_dissatisfied_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_neutral_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_satisfied_outlined,
                          size: 40,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.sentiment_very_satisfied_outlined,
                          size: 40,
                        ),
                      )
                    ],
                  )
                ]),
          )
        ],
      ),
    );
  }
}
