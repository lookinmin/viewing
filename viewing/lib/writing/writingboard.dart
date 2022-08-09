import 'package:flutter/material.dart';

void main() => runApp(WritingBoard());

class WritingBoard extends StatelessWidget {
  const WritingBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('게시판 글쓰기');
  }
}
