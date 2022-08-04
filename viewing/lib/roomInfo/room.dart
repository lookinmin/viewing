import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(Room());
}

class Room extends StatelessWidget {
  Room({Key? key}) : super(key: key);
  List<String> roomImg = [
    "images/room1.jpg",
    "images/room2.jpg",
    "images/room3.jpg",
    "images/room4.jpg",
    "images/room5.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
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
          )
        ],
      ),
    ));
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
  @override
  Widget build(BuildContext context) {
    return Container();
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text("방음",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      barGraph(3)
                    ],
                  ),
                  Row(
                    children: [
                      Text("청결",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      barGraph(1)
                    ],
                  ),
                  Row(
                    children: [
                      Text("시설",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      barGraph(4.3)
                    ],
                  ),
                  Row(
                    children: [
                      Text("안전",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      barGraph(2.7)
                    ],
                  ),
                ],
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
        width: 100, height: 100, child: Image.asset("images/rating.png"));
  } else if (num <= 2 && num > 1) {
    return SizedBox(
        width: 100, height: 100, child: Image.asset("images/rating.png"));
  } else if (num <= 3 && num > 2) {
    return SizedBox(
        width: 100, height: 100, child: Image.asset("images/rating.png"));
  } else if (num <= 4 && num > 3) {
    return SizedBox(
        width: 100, height: 100, child: Image.asset("images/star.png"));
  } else if (num <= 5 && num > 4) {
    return SizedBox(
        width: 100, height: 100, child: Image.asset("images/star.png"));
  } else {
    return SizedBox(
        width: 100, height: 100, child: Image.asset("images/star.png"));
  }
}

Widget barGraph(var grade) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 150,
        height: 10,
        padding: EdgeInsets.fromLTRB(10, 2, 10, 0),
        child: switchGraph(grade),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
        child: SizedBox(
          width: 30,
          child: Text(grade.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ),
      )
    ],
  );
}

Widget switchGraph(double grade) {
  if (grade < 1) {
    return Image.asset("images/loading.png", fit: BoxFit.fitWidth);
  } else if (grade <= 2 && grade > 1) {
    return Image.asset("images/loading.png", fit: BoxFit.fitWidth);
  } else if (grade <= 3 && grade > 2) {
    return Image.asset("images/loading.png", fit: BoxFit.fitWidth);
  } else if (grade <= 4 && grade > 3) {
    return Image.asset("images/loading.png", fit: BoxFit.fitWidth);
  } else if (grade <= 5 && grade > 4) {
    return Image.asset("images/loading.png", fit: BoxFit.fitWidth);
  } else {
    return Image.asset("images/loading.png", fit: BoxFit.fitWidth);
  }
}
