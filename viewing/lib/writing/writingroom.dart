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
