import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:viewing/roomInfo/room.dart';
import 'package:viewing/board/post.dart';

class BuilidingInfo {
  final String image;
  final String buildingName;
  final String deposit;
  final String monthly;
  final String manageFee;

  BuilidingInfo(this.image, this.buildingName, this.deposit, this.monthly,
      this.manageFee);
}

void main() {
  runApp(MainHome());
}

class MainHome extends StatelessWidget {
  MainHome({Key? key}) : super(key: key);
  List<String> eventImg = [
    "assets/images/event1.png",
    "assets/images/event2.png",
    "assets/images/event3.png",
  ];

  final roomInfo = [
    BuilidingInfo(
        'assets/images/room1_1.jpg', '다솜빌', "4,000,000", "370,000", "51,000"),
    BuilidingInfo(
        'assets/images/vRoom1.jpeg', '양지빌', "3,000,000", "320,000", "52,000"),
    BuilidingInfo(
        'assets/images/vRoom2.jpeg', '보성빌', "5,300,000", "300,000", "100,000"),
  ];

  final roomInfo2 = [
    BuilidingInfo(
        'assets/images/vRoom8.jpeg', '씨엔블루', "5,400,000", "340,000", "54,000"),
    BuilidingInfo(
        'assets/images/vRoom4.jpeg', '충대도담', "5,000,000", "350,000", "100,000"),
    BuilidingInfo(
        'assets/images/vRoom5.jpeg', '베스트빌', "5,600,000", "360,000", "30,000"),
    BuilidingInfo(
        'assets/images/vRoom6.jpeg', '초원A동', "4,000,000", "400,000", "38,000")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //상단 이벤트 사진 -> 나중에 carousel로 바꾸기
              Container(
                height: 180,
                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                child: CarouselSlider(
                  items: eventImg.map((e) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
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
                      enlargeCenterPage: true,
                      autoPlay: false,
                      scrollDirection: Axis.horizontal,
                      height: 160),
                ),
              ),
              //관심 지역 설정
              Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  height: 200,
                  child:
                      likeLocation(address: "청주시 흥덕구 복대동", roomInfo: roomInfo)),
              //중간 방 리스트
              Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  height: 200,
                  child:
                      RoomList(address: "청주시 서원구 개신동ㅐ", roomInfo2: roomInfo2)),
              //hot 게시글
              Container(
                height: 500,
                child: Board(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class likeLocation extends StatefulWidget {
  likeLocation({Key? key, required this.address, required this.roomInfo})
      : super(key: key);

  final address;
  final roomInfo;
  @override
  State<StatefulWidget> createState() => __likeLocateState();
}

class __likeLocateState extends State<likeLocation> {
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(3, 0, 5, 0),
                    child: Icon(
                      Icons.favorite,
                      color: Color.fromRGBO(255, 99, 99, 1),
                    ),
                  ),
                  Text(
                    "관심지역 : " + widget.address,
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
        ));
  }
}

class RoomList extends StatefulWidget {
  RoomList({Key? key, required this.address, required this.roomInfo2})
      : super(key: key);
  final address;
  final roomInfo2;

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
                Padding(
                  padding: EdgeInsets.fromLTRB(3, 0, 5, 0),
                  child: Icon(
                    Icons.near_me,
                    color: Color.fromRGBO(255, 99, 99, 1),
                  ),
                ),
                Text(
                  "내 주변 : " + widget.address,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: widget.roomInfo2.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return RoomInfo(item: widget.roomInfo2[index]);
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
    return InkWell(
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(builder: (context) => Room()),
          );
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  width: 1, color: Color.fromARGB(255, 204, 204, 204))),
          child: SizedBox(
            width: 240,
            child: Row(
              children: [
                Flexible(
                    flex: 6,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          widget.item.image,
                          fit: BoxFit.cover,
                          height: 100,
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
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  flex: 4,
                                  child: Text(
                                    '보증금: ',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Flexible(
                                  flex: 6,
                                  child: Text(
                                    widget.item.deposit,
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
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
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Flexible(
                                  flex: 6,
                                  child: Text(
                                    widget.item.monthly,
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
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
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Flexible(
                                  flex: 6,
                                  child: Text(
                                    widget.item.manageFee,
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
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
                                    child: Text('보러가기',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                248, 180, 0, 1.0),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500)),
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
        ));
  }
}

class Board extends StatefulWidget {
  Board({Key? key}) : super(key: key);

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
              Padding(
                padding: EdgeInsets.fromLTRB(3, 0, 5, 0),
                child: Icon(
                  Icons.local_fire_department,
                  color: Color.fromRGBO(255, 99, 99, 1),
                ),
              ),
              Text(
                'HOT 게시판',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
            child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            BoardInfo(item: boardinfo[0]),
            BoardInfo(item: boardinfo[1]),
            BoardInfo(item: boardinfo[2])
          ],
        )),
      ],
    );
  }
}

class BoardInfo extends StatefulWidget {
  const BoardInfo({Key? key, required this.item}) : super(key: key);
  final item;
  @override
  State<BoardInfo> createState() => _BoardInfoState();
}

class _BoardInfoState extends State<BoardInfo> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(builder: (context) => PostPage()),
          );
        },
        child: Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            // height:150,
            decoration: BoxDecoration(
              color: Color.fromRGBO(99, 99, 99, 0.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(widget.item.name,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        )),
                    Text(widget.item.date,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ))
                  ])),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(widget.item.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(widget.item.content,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ))),
              Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                    child: Row(children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.pink[400],
                        size: 15,
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
                          child: Text(widget.item.heartnum.toString(),
                              style: TextStyle(fontSize: 13))),
                      Icon(Icons.wechat, color: Colors.yellow[600]),
                      Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(widget.item.reviewnum.toString(),
                              style: TextStyle(fontSize: 13))),
                    ]),
                  )
                ]),
              )
            ])));
  }
}

class BoardModel {
  const BoardModel(this.name, this.title, this.content, this.heartnum,
      this.reviewnum, this.date);
  final String name;
  final String title;
  final String content;
  final int heartnum;
  final int reviewnum;
  final String date;
}

final boardinfo = [
  BoardModel("익명", "같이 볼링치러 가실 분~", "같이 볼링치러 가실 대학생 친구 구해요~ 저는 보통 100정도 나옵니다 !",
      1, 2, "2022.08.17"),
  BoardModel(
      "익명",
      "후문 헬스장에서 같이 운동하실 분 구해요~",
      "참고로 남자고 벤치 110정도 칩니다. 한번 운동할 때 1시간 반정도 같이 하시면 좋겠네요 ㅎ",
      7,
      5,
      "2022.08.18"),
  BoardModel("익명", "다우니 공동구매 할사람 0/6", "쿠팡에서 다우니 공동구매 하실 분 들 6분 구해요 댓글 남겨주세요",
      2, 5, "2022.08.18"),
];
