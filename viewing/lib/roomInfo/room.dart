import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(Room());
}

class Room extends StatelessWidget {
  Room({Key? key}) : super(key: key);
  List<String> roomImg = [
    "assets/images/room1_1.jpg",
    "assets/images/room1_2.jpg",
    "assets/images/room1_3.jpg",
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
                  height: 220,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: CarouselSlider(
                      items: roomImg.map((e) {
                        return Builder(builder: (BuildContext context) {
                          return Container(
                            // width: MediaQuery.of(context).size.width + 100,
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
                          viewportFraction:0.8,
                          enlargeCenterPage: true,
                          height: 200),
                    ),
                  )),

              Container(
                height: 185,
                child: RoomGrade(
                    address: "흥덕구 풍산로178번길 35",
                    roomName: "개신동 다솜빌",
                    grade: "4"),
              ),Divider(color: Colors.grey,thickness: 1.5,indent: 5,endIndent: 5,),
              Container(
                height: 130,
                child: CheckList(),
              ),Divider(color: Colors.grey,thickness: 1.5,indent: 5,endIndent: 5,),
              RoomReviews(),
            ],
          ),
        ),
      ),
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
            height: 45,
            padding: EdgeInsets.fromLTRB(25, 0, 260, 0),
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
          ),Divider(color: Colors.grey,thickness: 0.5,indent: 25,endIndent: 25,),
          Review(
              4,
              "2022.08.19",
              "익명",
              ["assets/images/room1_1.jpg"],
              "남향",
              "저층",
              "300/30",
              "신축이라 가구상태나 도배가 깨끗하고 좋아요, 여름에 습하지 않아서 좋아요",
              "저층이라 그런지 여름이나 겨울에 너무 덥거나 너무 추워요 방음이 조금 안되는게 흠이네요~ 그리고 주차장이 없는 것도 흠이에요"
            ),
          Review(
              5,
              "2022.07.27",
              "익명",
              ["assets/images/room1_2.jpg",
              "assets/images/room1_3.jpg"],
              "남향",
              "중층",
              "400/25",
              "방을 구할때 수압이 좋고 헬스장이 가깝고 제일 중요시하는데 수압도 좋고 헬스장도 자취방에서 3분거리에 있어서 좋아요. 그리고 벌레가 없다는 것도 장점이에요 지금까지 한번도 벌레를 본적이 없어요",
              "아주 만족하고 살고 있지만 단점이라고 굳이 말하자면 방안이 조용할때 옆방 소리가 조금 들린다는거 뿐이에요~"
            ),
          Review(
              3,
              "2022.06.17",
              "익명",
              [],
              "북향",
              "저층",
              "300/27",
              "집주인분이 착하시고 주변에 편의점이나 버스정류장이 가까운게 좋아요",
              "대로가 가까워서 창문을 열면 차소리가 많이 들려요 북향이라서 그런지 여름에는 조금 습하네요"
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
              width: 150,
              margin: EdgeInsets.fromLTRB(0, 0, 18, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.grey,
                  ),
                  Icon(Icons.close, color: Colors.grey),
                  Icon(
                    Icons.question_mark,
                    color: Color.fromARGB(255, 0, 179, 33),
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
              width: 150,
              margin: EdgeInsets.fromLTRB(0, 0, 18, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.grey,
                  ),
                  Icon(Icons.close, color: Colors.red),
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
              width: 150,
              margin: EdgeInsets.fromLTRB(0, 0, 18, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.check,
                    color: Color.fromARGB(221, 0, 140, 255),
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
            padding: const EdgeInsets.fromLTRB(13, 10, 0, 10),
            child: Text(
              widget.roomName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Row(
              children: [
                Icon(Icons.where_to_vote,color: Color.fromARGB(255, 0, 72, 255),),
                Text(
                  widget.address,
                  style: TextStyle(fontSize: 14),
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
                        barGraph(0.5)
                      ],
                    ),
                    Row(
                      children: [
                        Text("청결",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14)),
                        barGraph(0.8)
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
                        barGraph(0.8)
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
        width: 100,
        height: 100,
        child: Image.asset("assets/images/rating.png"));
  } else if (num <= 2 && num > 1) {
    return SizedBox(
        width: 100,
        height: 100,
        child: Image.asset("assets/images/rating.png"));
  } else if (num <= 3 && num > 2) {
    return SizedBox(
        width: 100,
        height: 100,
        child: Image.asset("assets/images/rating.png"));
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
          progressColor: Color.fromARGB(255, 255, 99, 99),
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

Widget Review(int num, var date, var name, List<String> pic,var direction,var floor,var fee,var adv,var disadv) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
    margin: EdgeInsets.fromLTRB(11, 5, 11, 0),
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
      color: Colors.grey,
      width: 1,
    ))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(8, 5, 8, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              setEmoji(num, name),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                  child: Text(
                    date,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Container(
                  width: 190,
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      chosenTxt(direction),
                      chosenTxt(floor),
                      chosenTxt(fee),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (pic.length>0)?
            CarouselSlider(
              items: pic.map((e) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    // width: MediaQuery.of(context).size.width + 100,
                    margin:
                        EdgeInsets.fromLTRB(6, 5, 6, 10),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
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
                  enableInfiniteScroll: false,
                  viewportFraction:0.96,
                  height: 200),
            ):SizedBox(),
            txtForRoom(adv,disadv)
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
          size: 55,
        ),
        Column(
           crossAxisAlignment: CrossAxisAlignment.start,
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
              style: TextStyle(fontSize: 14),
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
          size: 55,
        ),
        Column(
           crossAxisAlignment: CrossAxisAlignment.start,
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
              style: TextStyle(fontSize: 14),
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
          size: 55,
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
                style: TextStyle(fontSize: 14),
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
          size: 55,
        ),
        Column(
           crossAxisAlignment: CrossAxisAlignment.start,
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
              style: TextStyle(fontSize: 14),
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
          size: 55,
        ),
        Column(
           crossAxisAlignment: CrossAxisAlignment.start,
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
              style: TextStyle(fontSize: 14),
            )
          ],
        )
      ],
    );
  }
}

Widget txtForRoom(var adv,var disadv) {
  return Container(
    margin: EdgeInsets.fromLTRB(15, 15, 15, 25),
    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
    decoration: BoxDecoration(
      color: Color.fromRGBO(99, 99, 99, 0.05), //테두리
      borderRadius: BorderRadius.circular(15)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '장점.',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.red
          ),
        ),
        SizedBox(height: 15,),
        Text(
          adv,
          style: TextStyle(
            height: 1.5
          ),
        ),
        Divider(
          height: 20,
          color: Color.fromARGB(0, 158, 158, 158),
        ),
        Text(
          '단점.',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.blue
          ),
        ),SizedBox(height: 15,),
        Text(
          disadv,
          style: TextStyle(
            height: 1.5
          ),
        ),
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
