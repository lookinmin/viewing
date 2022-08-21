import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';
import 'package:viewing/writing/roomreviewsecond.dart';

void main() => runApp(WritingRoom());

class WritingRoom extends StatefulWidget {
  const WritingRoom({Key? key}) : super(key: key);

  @override
  State<WritingRoom> createState() => _WritingRoomState();
}

class HouseDir {
  String string;
  bool clicked = false;
  HouseDir(this.string);
}

class _WritingRoomState extends State<WritingRoom> {
  final List<String> _yearList = [
    '1년 이하',
    '2년 이하',
    '3년 이하',
    '4년 이하',
    '5년 이하',
  ];
  String _selectedYear = '1년 이하';

  final List<String> _floorList = [
    '저층',
    '중층',
    '고층',
  ];
  String _selectedFloor = '저층';

  List houseDir = [
    HouseDir('동'),
    HouseDir('서'),
    HouseDir('남'),
    HouseDir('북'),
  ];

  List typeClick = <bool>[false, false];

  int dirCnt = 0;

  final depositTxt = TextEditingController();
  final monthlyTxt = TextEditingController();
  final manageFeeTxt = TextEditingController();

  List<String> address_got = ['주소를 검색해주세요', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text('리뷰쓰기(기본정보)', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: firstPage(context),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(255, 99, 99, 1),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RoomReviewSecond()));
            },
            child: Text('다음')),
      ),
    );
  }

  Column firstPage(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: Text(
            '사용자의 익명성은 100% 보장됩니다',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
        address(context),
        residenceType(context),
        residencePeriod(context),
        residenceFloor(context),
        residenceDir(context),
        deposit(context),
        monthly(context),
        managementFee(context)
      ],
    );
  }

  Container monthly(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              '월세/전세/매매',
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(99, 99, 99, 0.05),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              decoration: InputDecoration(
                hintText: '예시) 월세 30만원냈어요~',
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 5),
              ),
              controller: monthlyTxt,
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }

  Container deposit(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              '보증금',
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(99, 99, 99, 0.05),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              decoration: InputDecoration(
                hintText: '예시) 보증금 300만원냈어요~',
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 5),
              ),
              controller: depositTxt,
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }

  Container residenceDir(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '집 방향',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '예시) 집이 남동향이라면 동과 남에 체크해주세요',
                  style: TextStyle(color: Colors.blue, fontSize: 10),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(99, 99, 99, 0.05),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                dirCheckBox(houseDir[0]),
                dirCheckBox(houseDir[1]),
                dirCheckBox(houseDir[2]),
                dirCheckBox(houseDir[3]),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row dirCheckBox(houseDir) {
    return Row(
      children: [
        Text(houseDir.string),
        Checkbox(
          value: houseDir.clicked,
          onChanged: (value) {
            setState(() {
              if (dirCnt >= 2) {
                if (houseDir.clicked) {
                  houseDir.clicked = false;
                  dirCnt--;
                } else {
                  houseDir.clicked = false;
                }
              } else {
                houseDir.clicked = !houseDir.clicked;
                houseDir.clicked ? dirCnt++ : dirCnt--;
              }
            });
          },
          activeColor: Color.fromRGBO(255, 99, 99, 1),
        ),
      ],
    );
  }

  Column managementFee(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            '관리비',
            style: TextStyle(fontSize: 17),
          ),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(
              color: Color.fromRGBO(99, 99, 99, 0.05),
              borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: TextField(
            maxLines: 5,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 5),
                hintText:
                    '예시) 102동 기준 공용 관리비 15만원 정도예요. 부대 시설 비용 다 포함입니다~. 전기세는 여름에 에어컨을 종일 틀고 20만원 정도 나왔어요.'),
            controller: manageFeeTxt,
          ),
        ),
      ],
    );
  }

  Container residenceFloor(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              '거주층',
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(99, 99, 99, 0.05),
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: DropdownButton(
                isExpanded: true,
                icon: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.keyboard_arrow_down),
                ),
                underline: SizedBox.shrink(),
                value: _selectedFloor,
                items: _floorList.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                              width: 1.0,
                              color: Color.fromARGB(255, 191, 190, 190)),
                        )),
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 16),
                        )),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedFloor = value.toString();
                  });
                },
              )),
        ],
      ),
    );
  }

  Container residencePeriod(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              '거주 기간',
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(99, 99, 99, 0.05),
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: DropdownButton(
                isExpanded: true,
                icon: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.keyboard_arrow_down),
                ),
                underline: SizedBox.shrink(),
                value: _selectedYear,
                items: _yearList.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                              width: 1.0,
                              color: Color.fromARGB(255, 191, 190, 190)),
                        )),
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 16),
                        )),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedYear = value.toString();
                  });
                },
              )),
        ],
      ),
    );
  }

  Container residenceType(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              '거주 유형',
              style: TextStyle(fontSize: 17),
            ),
          ),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary:
                              !typeClick[0] ? Colors.black : Colors.white,
                          fixedSize: Size(
                              MediaQuery.of(context).size.width / 2 - 40, 50),
                          primary: !typeClick[0]
                              ? Colors.white
                              : Color.fromRGBO(255, 99, 99, 1)),
                      onPressed: () {
                        setState(() {
                          typeClick[0] = !typeClick[0];
                          if (typeClick[1]) {
                            typeClick[1] = false;
                          }
                        });
                      },
                      child: Text('아파트/빌라/주택')),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary:
                              !typeClick[1] ? Colors.black : Colors.white,
                          fixedSize: Size(
                              MediaQuery.of(context).size.width / 2 - 40, 50),
                          primary: !typeClick[1]
                              ? Colors.white
                              : Color.fromRGBO(255, 99, 99, 1)),
                      onPressed: () {
                        setState(() {
                          typeClick[1] = !typeClick[1];
                          if (typeClick[0]) {
                            typeClick[0] = false;
                          }
                        });
                      },
                      child: Text('원룸/투룸/오피스텔')),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  GestureDetector address(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => KpostalView(
                useLocalServer: true,
                localPort: 7001,
                callback: (Kpostal result) {
                  print(result.address);
                  address_got = [result.jibunAddress, result.roadAddress];
                },
              ),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                '주소지',
                style: TextStyle(fontSize: 17),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(99, 99, 99, 0.05),
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: address_got[1] == ''
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(flex: 8, child: Text('주소를 검색하세요')),
                        Expanded(child: Icon(Icons.search)),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          address_got[0],
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          address_got[1],
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
