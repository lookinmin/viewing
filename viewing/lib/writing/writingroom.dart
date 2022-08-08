import 'package:flutter/material.dart';

void main() => runApp(WritingRoom());

class WritingRoom extends StatelessWidget {
  const WritingRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('방정보 글쓰기');
  }
}
