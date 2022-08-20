import 'package:flutter/material.dart';
import 'package:viewing/board/post.dart';

class myBoardPost extends StatefulWidget {
  const myBoardPost({Key? key}) : super(key: key);

  @override
  State<myBoardPost> createState() => _myBoardPostState();
}

class _myBoardPostState extends State<myBoardPost> {
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
        body: BoardList());
  }
}

class BoardList extends StatelessWidget {
  const BoardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: boardinfo.length,
            itemBuilder: (BuildContext context, int index) {
              return BoardInfo(item: boardinfo[index]);
            }));
  }
}

class BoardInfo extends StatefulWidget {
  const BoardInfo({Key? key, required this.item}) : super(key: key);
  final item;

  @override
  State<BoardInfo> createState() => _BoardInfoState();
}

class _BoardInfoState extends State<BoardInfo> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PostPage()));
        },
        child: Container(
            margin: EdgeInsets.fromLTRB(15, 5, 15, 10),
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            // height:150,
            decoration: BoxDecoration(
              color: Color.fromRGBO(99, 99, 99, 0.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text(widget.item.name,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        )),
                    Text(widget.item.date,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ))
                  ])),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(widget.item.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(widget.item.content,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ))),
              Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                    child: Row(children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.pink[400],
                        size: 15,
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
                          child: Text(widget.item.heartnum.toString(),
                              style: TextStyle(fontSize: 13))),
                      Icon(Icons.wechat, color: Colors.yellow[600]),
                      Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(widget.item.reviewnum.toString(),
                              style: TextStyle(fontSize: 13))),
                    ]),
                  )
                ]),
              )
            ])));
  }
}

class BoardModel {
  const BoardModel(this.name, this.title, this.content, this.heartnum,
      this.reviewnum, this.date);
  final String name;
  final String title;
  final String content;
  final int heartnum;
  final int reviewnum;
  final String date;
}

final boardinfo = [
  BoardModel("익명", "같이 볼링치러 가실 분~", "같이 볼링치러 가실 대학생 친구 구해요~ 저는 보통 100정도 나옵니다 !",
      1, 2, "2022.08.19"),
  BoardModel("익명", "다우니 공동구매 할사람 0/6", "쿠팡에서 다우니 공동구매 하실 분 들 6분 구해요 댓글 남겨주세요",
      2, 5, "2022.08.18")
];
