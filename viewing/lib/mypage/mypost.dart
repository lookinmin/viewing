import 'package:flutter/material.dart';
import 'package:viewing/mypage/myreview.dart';
import 'package:viewing/mypage/myboardpost.dart';

class myPost extends StatefulWidget {
  const myPost({Key? key}) : super(key: key);

  @override
  State<myPost> createState() => _myPostState();
}

class _myPostState extends State<myPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '내가 쓴 게시글',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          toolbarHeight: 50.0,
          elevation: 1.0, // 그림자 제거
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
                  ListTile(
                    title: Text('내가 쓴 방정보'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => myReview()));
                    },
                  ),
                  ListTile(
                    //leading: Icon(Icons.watch),
                    title: Text('내가 쓴 게시글'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => myBoardPost()));
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
