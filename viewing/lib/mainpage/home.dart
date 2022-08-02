import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainHome());

class Information {
  final String buildingName;
  final String deposit;
  final String monthly;
  final String manageFee;

  Information(this.buildingName, this.deposit, this.monthly, this.manageFee);

  String getBuildingName() {
    return buildingName;
  }

  String getDeposit() {
    return deposit;
  }

  String getMonthly() {
    return monthly;
  }

  String getManageFee() {
    return manageFee;
  }
}

class MainHome extends StatelessWidget {
  MainHome({Key? key}) : super(key: key);
  List<String> eventImg = [
    "coffee.png",
    "coffee.png",
    "coffee.png",
    "coffee.png",
    "coffee.png"
  ];

  final roomInfo = [
    Information('도담1', "5,000,000", "300,000", "50,000"),
    Information('도담2', "5,100,000", "310,000", "51,000"),
    Information('도담3', "5,200,000", "320,000", "52,000"),
    Information('도담4', "5,300,000", "330,000", "53,000"),
    Information('도담5', "5,400,000", "340,000", "54,000"),
    Information('도담6', "5,500,000", "350,000", "55,000"),
    Information('도담7', "5,600,000", "360,000", "56,000"),
    Information('도담8', "5,700,000", "370,000", "57,000")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          //상단 이벤트 사진 -> 나중에 carousel로 바꾸기
          Flexible(
              flex: 3,
              child: CarouselSlider(
                  items: eventImg.map((e) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        // width: MediaQuery.of(context).size.width + 100,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              e,
                              fit: BoxFit.fill,
                              width: 500,
                            )),
                      );
                    });
                  }).toList(),
                  options: CarouselOptions(
                      // autoPlay: true,
                      // autoPlayInterval: Duration(seconds: 3),
                      // autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      // autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal))),
          //중간 방 리스트
          Flexible(
            flex: 4,
            child: RoomList(address: "청주시 서원구 사창동", roomInfo: roomInfo),
          ),
          //hot
          Flexible(flex: 7, child: Board()),
        ],
      ),
    );
  }
}

class RoomList extends StatefulWidget {
  RoomList({Key? key, required this.address, required this.roomInfo})
      : super(key: key);
  final address;
  final roomInfo;

  @override
  State<RoomList> createState() => __RoomListState();
}

class __RoomListState extends State<RoomList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Icon(
                  Icons.near_me,
                  color: Color.fromRGBO(255, 99, 99, 1),
                ),
                Text(
                  widget.address,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: widget.roomInfo.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return RoomInfo(item: widget.roomInfo[index]);
                  }))
        ],
      ),
    );
  }
}

class RoomInfo extends StatefulWidget {
  const RoomInfo({Key? key, required this.item}) : super(key: key);
  final item;

  @override
  State<RoomInfo> createState() => _RoomInfo();
}

class _RoomInfo extends State<RoomInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(0, 7), // changes position of shadow
            )
          ]),
      child: SizedBox(
        width: 240,
        child: Row(
          children: [
            Flexible(
                flex: 6,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'coffee.png',
                      fit: BoxFit.cover,
                      width: 200,
                    ))),
            Flexible(
                flex: 4,
                child: Container(
                  height: 120,
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                          child: Text(widget.item.buildingName,
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 99, 99, 1),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 10))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 4,
                              child: Text(
                                '보증금: ',
                                style: TextStyle(fontSize: 8),
                              )),
                          Flexible(
                              flex: 6,
                              child: Text(
                                widget.item.deposit,
                                style: TextStyle(fontSize: 8),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 4,
                              child:
                                  Text('월세: ', style: TextStyle(fontSize: 8))),
                          Flexible(
                              flex: 6,
                              child: Text(widget.item.monthly,
                                  style: TextStyle(fontSize: 8)))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 4,
                              child:
                                  Text('관리비: ', style: TextStyle(fontSize: 8))),
                          Flexible(
                              flex: 6,
                              child: Text(widget.item.manageFee,
                                  style: TextStyle(fontSize: 8)))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 9,
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('보러가기',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(248, 180, 0, 1.0),
                                          fontSize: 8)))),
                          Flexible(
                              flex: 1,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 8,
                                color: Color.fromRGBO(248, 180, 0, 1.0),
                              ))
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Icon(
                Icons.near_me,
                color: Color.fromRGBO(255, 99, 99, 1),
              ),
              Text(
                'HOT 게시판',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [BoardList()],
          ),
        )
      ],
    );
  }
}

class BoardList extends StatefulWidget {
  const BoardList({Key? key}) : super(key: key);

  @override
  State<BoardList> createState() => _BoardListState();
}

class _BoardListState extends State<BoardList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 242, 242, 242),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(0, 7), // changes position of shadow
            )
          ]),
      child: Container(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          height: 65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '22시 치킨 시키실 분',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
              ),
              Text('치킨 같이 시키실 분 구해요'),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Icon(Icons.favorite,
                          color: Color.fromRGBO(255, 99, 99, 1))),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        '10',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      )),
                  Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.sms,
                        color: Colors.yellow,
                      )),
                  Text(
                    '10',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
