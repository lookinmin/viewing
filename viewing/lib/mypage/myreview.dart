import 'package:flutter/material.dart';
import 'package:viewing/roomInfo/room.dart';

class myReview extends StatefulWidget {
  const myReview({Key? key}) : super(key: key);

  @override
  State<myReview> createState() => _myReviewState();
}

class _myReviewState extends State<myReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '내가 쓴 방정보',
          style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        toolbarHeight: 50.0,
        elevation: 1.0, // 그림자 제거
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
      ),
      body: PostList(),
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: postinfo.length,
            // scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return RoomInfo(item: postinfo[index]);
            }));
  }
}

class RoomInfo extends StatefulWidget {
  const RoomInfo({Key? key, required this.item}) : super(key: key);
  final item;

  @override
  State<RoomInfo> createState() => _RoomInfo();
}

class _RoomInfo extends State<RoomInfo> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Room())),
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 5, 15, 10),
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          decoration: BoxDecoration(
              color: Color.fromRGBO(99, 99, 99, 0.05),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  flex: 5,
                  child: Container(
                      color: Colors.red,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            widget.item.image,
                            fit: BoxFit.cover,
                            width: 180,
                          )))),
              Flexible(
                  flex: 5,
                  child: Container(
                    height: 120,
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                            child: Text(widget.item.buildingName,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 99, 99, 1),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15))),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                flex: 4,
                                child: Text(
                                  '보증금: ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                )),
                            Flexible(
                                flex: 6,
                                child: Text(
                                  widget.item.deposit,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                flex: 4,
                                child: Text(
                                  '월세: ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                )),
                            Flexible(
                                flex: 6,
                                child: Text(
                                  widget.item.monthly,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                flex: 4,
                                child: Text(
                                  '관리비: ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                )),
                            Flexible(
                                flex: 6,
                                child: Text(
                                  widget.item.manageFee,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ))
                          ],
                        ),
                        InkWell(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Room())),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  flex: 9,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('보러가기',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                248, 180, 0, 1.0),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700)),
                                  )),
                              Flexible(
                                  flex: 1,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 8,
                                    color: Color.fromRGBO(248, 180, 0, 1.0),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}

class PostModel {
  const PostModel(this.image, this.buildingName, this.deposit, this.monthly,
      this.manageFee);
  final String image;
  final String buildingName;
  final String deposit;
  final String monthly;
  final String manageFee;
}

final postinfo = [
  PostModel('assets/coffee.png', '개신 오피스빌', "5,100,000", "310,000",
      "51,000"), //BuilidingInfo
  PostModel('assets/coffee.png', '충대도담', "3,400,000", "370,000", "57,000")
];
