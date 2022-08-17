import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:viewing/roomInfo/room.dart';

class BuilidingInfo {
  final String image;
  final String buildingName;
  final String deposit;
  final String monthly;
  final String manageFee;

  BuilidingInfo(this.image, this.buildingName, this.deposit, this.monthly,
      this.manageFee);
}

class BoardInfo {
  final String title;
  final String contents;
  final int like;
  final int comments;

  BoardInfo(this.title, this.contents, this.like, this.comments);
}

void main() {
  runApp(MainHome());
}

class MainHome extends StatelessWidget {
  MainHome({Key? key}) : super(key: key);
  List<String> eventImg = [
    "/images/event1.png",
    "/images/event2.png",
    "/images/event3.png",
    "assets/coffee.png",
    "assets/coffee.png",
    "assets/coffee.png",
    "assets/coffee.png",
    "assets/coffee.png"
  ];

  final roomInfo = [
    BuilidingInfo('assets/coffee.png', '개신 오피스빌', "5,100,000", "310,000", "51,000"),
    BuilidingInfo('assets/coffee.png', '양지빌', "5,200,000", "320,000", "52,000"),
    BuilidingInfo('assets/coffee.png', '보성빌', "5,300,000", "330,000", "53,000"),
    BuilidingInfo('assets/coffee.png', '도담1', "5,000,000", "300,000", "50,000"),
    BuilidingInfo('assets/coffee.png', '도담5', "5,400,000", "340,000", "54,000"),
    BuilidingInfo('assets/coffee.png', '도담6', "5,500,000", "350,000", "55,000"),
    BuilidingInfo('assets/coffee.png', '도담7', "5,600,000", "360,000", "56,000"),
    BuilidingInfo('assets/coffee.png', '도담8', "5,700,000", "370,000", "57,000")
  ];

  final boardInfo = [
    BoardInfo('17시 치킨 시키실 분', '치킨 같이 시키실 분 구해요', 11, 28),
    BoardInfo('18시 피자 시키실 분', '피자 같이 시키실 분 구해요', 12, 27),
    BoardInfo('19시 짜장면 시키실 분', '짜장면 같이 시키실 분 구해요', 13, 26),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          //상단 이벤트 사진 -> 나중에 carousel로 바꾸기
          Container(
            height: 150,
            margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
            padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
            child: CarouselSlider(
              items: eventImg.map((e) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
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
                  height: 150),
            ),
          ),
          //중간 방 리스트
          Flexible(
            flex: 4,
            child: RoomList(address: "청주시 서원구 사창동", roomInfo: roomInfo),
          ),
          //hot
          Flexible(flex: 7, child: Board(board: boardInfo)),
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
                      widget.item.image,
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
                                  fontSize: 13))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 4,
                              child: Text(
                                '보증금: ',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              )),
                          Flexible(
                              flex: 6,
                              child: Text(
                                widget.item.deposit,
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 4,
                              child: Text(
                                '월세: ',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              )),
                          Flexible(
                              flex: 6,
                              child: Text(
                                widget.item.monthly,
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 4,
                              child: Text(
                                '관리비: ',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              )),
                          Flexible(
                              flex: 6,
                              child: Text(
                                widget.item.manageFee,
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 9,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .push(
                                        MaterialPageRoute(
                                            builder: (context) => Room()),
                                      );
                                    },
                                    child: Text('보러가기',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                248, 180, 0, 1.0),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700))),
                              )),
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
  Board({Key? key, required this.board}) : super(key: key);
  final board;
  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('게시판 클릭'),
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
                  'HOT 게시판',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            // child: ListView.builder(
            //     itemCount: widget.board.length,
            //     scrollDirection: Axis.vertical,
            //     itemBuilder: (BuildContext context, int index) {
            //       return BoardList(item: widget.board[index]);
            //     }),
            child: Column(
              children: [
                BoardList(item: widget.board[0]),
                BoardList(item: widget.board[1]),
                BoardList(item: widget.board[2])
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BoardList extends StatefulWidget {
  BoardList({Key? key, required this.item}) : super(key: key);
  final item;
  @override
  State<BoardList> createState() => _BoardListState();
}

class _BoardListState extends State<BoardList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
          height: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.title,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
              ),
              Text(widget.item.contents),
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
                        '${widget.item.like}',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      )),
                  Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.sms,
                        color: Colors.yellow,
                      )),
                  Text(
                    '${widget.item.comments}',
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
