import 'package:flutter/material.dart';

void main() => runApp(MainHome());

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          //상단 이벤트 사진
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'coffee.png',
                    fit: BoxFit.cover,
                    width: 300,
                  )),
            ),
          ),
          //중간 방 리스트
          Flexible(
            flex: 4,
            child: RoomList(address: "청주시 서원구 사창동"),
          ),
          //hot
          Flexible(flex: 7, child: Board()),
        ],
      ),
    );
  }
}

class RoomList extends StatefulWidget {
  const RoomList({Key? key, required String address}) : super(key: key);

  @override
  State<RoomList> createState() => __RoomListState();
}

class __RoomListState extends State<RoomList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
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
                  'address',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                RoomInfo(),
                RoomInfo(),
                RoomInfo(),
                RoomInfo(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RoomInfo extends StatefulWidget {
  const RoomInfo({Key? key}) : super(key: key);

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
                          child: Text('개신동 충대도담',
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
                                '3,000,000',
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
                              child: Text('350,000',
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
                              child:
                                  Text('50,000', style: TextStyle(fontSize: 8)))
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
