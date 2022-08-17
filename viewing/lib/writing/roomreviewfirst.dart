import 'package:flutter/material.dart';

void main() => runApp(WritingRoom());

class WritingRoom extends StatefulWidget {
  const WritingRoom({Key? key}) : super(key: key);

  @override
  State<WritingRoom> createState() => _WritingRoomState();
}

class _WritingRoomState extends State<WritingRoom> {
  final List<String> _yearList = [
    '2022년까지',
    '2023년까지',
    '2024년까지',
    '2025년까지',
    '2026년까지',
    '2027년까지'
  ];
  String _selectedYear = '2022년까지';

  final List<String> _floorList = [
    '저층',
    '중층',
    '고층',
  ];
  String _selectedFloor = '저층';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          '리뷰쓰기(기본정보)',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        )),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: firstPage(context),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(255, 99, 99, 1),
            ),
            onPressed: () {
              print('btnClick');
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
        address(),
        residenceType(context),
        residencePeriod(context),
        residenceFloor(context),
        managementFee(context)
      ],
    );
  }

  Container managementFee(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              '관리비',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
            ),
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 221, 221),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              maxLines: 5,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none, //검색 아이콘 추가
                  contentPadding:
                      EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 5),
                  hintText:
                      '집품: 102동 기준 공용 관리비 15만원 정도예요. 부대 시설 비용 다 포함입니다~. 전기세는 여름에 에어컨을 종일 틀고 20만원 정도 나왔어요.'),
            ),
          ),
        ],
      ),
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
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 221, 221, 221),
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
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 221, 221, 221),
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
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
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
                          fixedSize: Size(
                              MediaQuery.of(context).size.width / 2 - 40, 50),
                          primary: Color.fromRGBO(255, 99, 99, 1)),
                      onPressed: () {},
                      child: Text('아파트/오피스텔')),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              MediaQuery.of(context).size.width / 2 - 40, 50),
                          primary: Color.fromRGBO(255, 99, 99, 1)),
                      onPressed: () {},
                      child: Text('원룸/빌라/주택', style: TextStyle(fontSize: 16))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container address() {
    return Container(
      height: 200,
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                '주소지',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
              ),
            ),
          ),
          Expanded(
              flex: 8,
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
              ))
        ],
      ),
    );
  }
}
