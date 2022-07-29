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
          Flexible(
            flex: 4,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'coffee.png',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Flexible(
            flex: 4,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.near_me,
                        color: Color.fromRGBO(255, 99, 99, 1),
                      ),
                      Text(
                        '청주시 서원구 사창동',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    RoomInfo(),
                    // RoomInfo(),
                    // RoomInfo(),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 7,
            child: Container(color: Colors.green),
          )
        ],
      ),
    );
  }
}

class RoomInfo extends StatelessWidget {
  const RoomInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
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
