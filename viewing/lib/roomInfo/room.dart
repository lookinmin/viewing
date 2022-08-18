import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(Room());
}

class Room extends StatelessWidget {
  Room({Key? key}) : super(key: key);
  List<String> roomImg = [
    "assets/images/room1.jpg",
    "assets/images/room2.jpg",
    "assets/images/room3.jpg",
    "assets/images/room4.jpg",
    "assets/images/room5.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, statusBarHeight, 0, 0),
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
                height: 200,
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ))),
                  child: CarouselSlider(
                    items: roomImg.map((e) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          // width: MediaQuery.of(context).size.width + 100,
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              e,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      });
                    }).toList(),
                    options: CarouselOptions(
                        autoPlay: false,
                        scrollDirection: Axis.horizontal,
                        height: 200),
                  ),
                )),
            Container(
              height: 190,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 2.0,
              ))),
              child: RoomGrade(
                  address: "개신동 충대로 1 13번길", roomName: "개신동 해오름빌", grade: "2"),
            ),
            Container(
              height: 130,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 2.0,
              ))),
              child: CheckList(),
            ),
            RoomReviews(),
          ],
        ),
      ),),
    );
  }
}

class RoomGrade extends StatefulWidget {
  RoomGrade(
      {Key? key,
      required this.address,
      required this.roomName,
      required this.grade})
      : super(key: key);
  final address;
  final roomName;
  final grade;

  @override
  State<RoomGrade> createState() => _RoomGrade();
}

class CheckList extends StatefulWidget {
  @override
  State<CheckList> createState() => _CheckList();
}

class RoomReviews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RoomReview();
}

class _RoomReview extends State<RoomReviews> {
  final _valueList = ["최근 작성순", "별점 높은순", "별점 낮은순"];
  var _selectedValue = "최근 작성순";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey,
              width: 2.0,
            ))),
            height: 45,
            padding: EdgeInsets.fromLTRB(18, 3, 260, 0),
            child: DropdownButton(
              value: _selectedValue,
              items: _valueList.map(
                (value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value.toString();
                });
              },
            ),
          ),
          for (int i = 0; i < 3; i++)
            Review(
              3,
              "2022.09.17",
              "익명",
              "assets/images/room1.jpg",
            )
        ],
      ),
    );
  }
}

class _CheckList extends State<CheckList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(18, 0, 10, 0),
              child: Text(
                "집주인 진위 여부",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.fromLTRB(0, 0, 18, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.grey,
                  ),
                  Icon(Icons.close, color: Colors.grey),
                  Icon(
                    Icons.question_mark,
                    color: Colors.grey,
                  )
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(18, 0, 10, 0),
              child: Text(
                "등기부등본 확인 유무",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.fromLTRB(0, 0, 18, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.grey,
                  ),
                  Icon(Icons.close, color: Colors.grey),
                  Icon(
                    Icons.question_mark,
                    color: Colors.grey,
                  )
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(18, 0, 10, 0),
              child: Text(
                "불법건축물 확인 유무",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.fromLTRB(0, 0, 18, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.grey,
                  ),
                  Icon(Icons.close, color: Colors.grey),
                  Icon(
                    Icons.question_mark,
                    color: Colors.grey,
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class _RoomGrade extends State<RoomGrade> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.roomName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Row(
              children: [
                Icon(Icons.where_to_vote),
                Text(
                  widget.address,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  switchImg(widget.grade),
                  Text(
                    widget.grade + " / 5",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(28, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text("방음",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14)),
                        barGraph(0.3)
                      ],
                    ),
                    Row(
                      children: [
                        Text("청결",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14)),
                        barGraph(0.5)
                      ],
                    ),
                    Row(
                      children: [
                        Text("시설",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14)),
                        barGraph(0.7)
                      ],
                    ),
                    Row(
                      children: [
                        Text("안전",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14)),
                        barGraph(0.5)
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget switchImg(String grade) {
  int num = int.parse(grade);
  if (num < 1) {
    return SizedBox(
        width: 100, height: 100, child: Image.asset("assets/images/rating.png"));
  } else if (num <= 2 && num > 1) {
    return SizedBox(
        width: 100, height: 100, child: Image.asset("assets/images/rating.png"));
  } else if (num <= 3 && num > 2) {
    return SizedBox(
        width: 100, height: 100, child: Image.asset("assets/images/rating.png"));
  } else if (num <= 4 && num > 3) {
    return SizedBox(
        width: 100, height: 100, child: Image.asset("assets/images/star.png"));
  } else if (num <= 5 && num > 4) {
    return SizedBox(
        width: 100, height: 100, child: Image.asset("assets/images/star.png"));
  } else {
    return SizedBox(
        width: 100, height: 100, child: Image.asset("assets/images/star.png"));
  }
}

Widget barGraph(var grade) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 145,
        height: 10,
        padding: EdgeInsets.fromLTRB(6, 2, 8, 0),
        child: LinearPercentIndicator(
          width: 130.0,
          lineHeight: 10.0,
          percent: grade,
          progressColor: Colors.red,
        ),
      ),
      SizedBox(
        width: 5,
        child: Text(((grade * 10).truncate()).toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ),
    ],
  );
}

Widget Review(int num, var date, var name, var pic) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
    margin: EdgeInsets.fromLTRB(13, 0, 13, 0),
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
      color: Colors.grey,
      width: 1.0,
    ))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            setEmoji(num, name),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 5, 0),
              child: Text(
                date,
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  pic,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            txtForRoom()
          ],
        )
      ],
    ),
  );
}

Widget setEmoji(int num, var name) {
  if (num == 1) {
    return Row(
      children: [
        Icon(
          Icons.sentiment_very_dissatisfied,
          color: Color.fromARGB(255, 255, 154, 59),
          size: 50,
        ),
        Column(
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Colors.grey),
                Icon(Icons.star, color: Colors.grey),
                Icon(Icons.star, color: Colors.grey),
                Icon(Icons.star, color: Colors.grey),
              ],
            ),
            Text(
              name,
              style: TextStyle(fontSize: 12),
            )
          ],
        )
      ],
    );
  }
  if (num == 2) {
    return Row(
      children: [
        Icon(
          Icons.sentiment_dissatisfied,
          color: Color.fromARGB(255, 255, 154, 59),
          size: 50,
        ),
        Column(
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Colors.grey),
                Icon(Icons.star, color: Colors.grey),
                Icon(Icons.star, color: Colors.grey),
              ],
            ),
            Text(
              name,
              style: TextStyle(fontSize: 12),
            )
          ],
        )
      ],
    );
  }
  if (num == 3) {
    return Row(
      children: [
        Icon(
          Icons.sentiment_satisfied,
          color: Color.fromARGB(255, 255, 154, 59),
          size: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Colors.grey),
                Icon(Icons.star, color: Colors.grey),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Text(
                name,
                style: TextStyle(fontSize: 13),
              ),
            )
          ],
        )
      ],
    );
  }
  if (num == 4) {
    return Row(
      children: [
        Icon(
          Icons.sentiment_satisfied_alt,
          color: Color.fromARGB(255, 255, 154, 59),
          size: 50,
        ),
        Column(
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Colors.grey),
              ],
            ),
            Text(
              name,
              style: TextStyle(fontSize: 12),
            )
          ],
        )
      ],
    );
  } else {
    return Row(
      children: [
        Icon(
          Icons.sentiment_very_satisfied,
          color: Color.fromARGB(255, 255, 154, 59),
          size: 50,
        ),
        Column(
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
                Icon(Icons.star, color: Color.fromARGB(255, 255, 154, 59)),
              ],
            ),
            Text(
              name,
              style: TextStyle(fontSize: 12),
            )
          ],
        )
      ],
    );
  }
}

Widget txtForRoom() {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
    child: Column(
      children: [
        Container(
          width: 190,
          margin: EdgeInsets.fromLTRB(7, 0, 0, 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              chosenTxt("남향"),
              chosenTxt("저층"),
              chosenTxt("500/35"),
            ],
          ),
        ),
        Container(
          width: 190,
          height: 80,
          child: Row(
            children: [
              Flexible(
                child: RichText(
                  overflow: TextOverflow.fade,
                  strutStyle: StrutStyle(fontSize: 13.0),
                  text: TextSpan(
                      text:
                          '신축이라 깨끗하고 좋은데 쓰레기 관리가 너무 안돼요ㅜㅜ 여름이 되니까 악취가 심한편입니다. 냄새 예민하신분들은 고려하셔야 할 것 같아요! 집 사이즈는 작지만 가구상태나 도배는 깨끗하고 좋아요!',
                      style: TextStyle(
                          color: Colors.black, height: 1.4, fontSize: 12.0)),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget chosenTxt(var str) {
  return Container(
    padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 1.5),
        borderRadius: BorderRadius.circular(20)),
    child: Text(
      str,
      style: TextStyle(color: Colors.blue, fontSize: 13.5),
    ),
  );
}
