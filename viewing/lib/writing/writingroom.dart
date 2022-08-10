import 'package:flutter/material.dart';

void main() => runApp(WritingRoom());

class WritingRoom extends StatelessWidget {
  const WritingRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          '리뷰쓰기(기본정보)',
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 150,
              color: Colors.amberAccent,
            ),
            Container(
              height: 150,
              color: Colors.blueAccent,
            ),
            Container(
              height: 150,
              color: Colors.redAccent,
            ),
            Container(
              height: 150,
              color: Colors.greenAccent,
            ),
            Container(
              height: 150,
              color: Colors.cyanAccent,
            ),
          ],
        ),
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
}
