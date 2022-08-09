import 'package:flutter/material.dart';

class recent extends StatefulWidget {
  const recent({Key? key}) : super(key: key);

  @override
  State<recent> createState() => _recentState();
}

class _recentState extends State<recent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '회원정보 수정',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          toolbarHeight: 50.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.grey,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(0),
          child: ListView(
            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
            children: [
              Column(
                children: [
                  ListTile(title: Text('닉네임 변경')),
                  ListTile(
                    //leading: Icon(Icons.watch),
                    title: Text('비밀번호 변경'),
                    trailing: Icon(Icons.chevron_right),
                    // onTap: () {
                    //   Navigator.pushNamed(context, '/recent');
                    // },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
