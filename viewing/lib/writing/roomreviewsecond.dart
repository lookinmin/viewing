import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viewing/main.dart';

class btnClick {
  bool btn1 = false;
  bool btn2 = false;
  bool btn3 = false;
  Color color1 = Colors.grey;
  Color color2 = Colors.grey;
  Color color3 = Colors.grey;
}

class RoomReviewSecond extends StatefulWidget {
  const RoomReviewSecond({Key? key}) : super(key: key);

  @override
  State<RoomReviewSecond> createState() => _RoomReviewSecondState();
}

class _RoomReviewSecondState extends State<RoomReviewSecond> {
  String text = "보통이에요";
  Icon icon = Icon(Icons.sentiment_neutral, color: Colors.yellow);
  final goodText = TextEditingController();
  final badText = TextEditingController();
  var verifyingBtn = [btnClick(), btnClick(), btnClick()];

  File? _image;
  final picker = ImagePicker();
  List imageList = [];
  int imageCnt = 0;

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      // _image = File(image!.path); // 가져온 이미지를 _image에 저장
      imageList.add(File(image!.path));
      // imageCnt++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          '리뷰쓰기',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            buildingScore(),
            goodOrBad(context, '장점', goodText),
            goodOrBad(context, '단점', badText),
            confirmation(context),
            uploadPic(),
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
              showModalBottomSheet<void>(
                context: context,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, setState) => SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: modalColumn(context),
                          ));
                },
              ).then((value) {
                setState(() {});
              });
            },
            child: Text('확인')),
      ),
    );
  }

  Column modalColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        //상단 x 버튼
        Flexible(
          flex: 1,
          child: Row(
            children: [
              Expanded(child: Container()),
              IconButton(
                icon: Icon(
                  Icons.close_rounded,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Text(
            '리뷰를 작성해줘서 고마워요!\n당신이 생각하는 이 곳의 만족도는?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
          ),
        ),
        Flexible(
          flex: 4,
          child: ratingBar(),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(255, 99, 99, 1),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text('작성완료')),
          ),
        ),
      ],
    );
  }

  Container buildingScore() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                '건물 정보',
                style: TextStyle(fontSize: 17),
              )),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(99, 99, 99, 0.05),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('방음'),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 30,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('청결'),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 30,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('시설'),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 30,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('안전'),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 30,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          //
        ],
      ),
    );
  }

  Container confirmation(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              '진위 여부(중요!)',
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(99, 99, 99, 0.05),
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    certification('집주인 진위 여부', verifyingBtn[0]),
                    certification('등기부등본 확인 유무', verifyingBtn[1]),
                    certification('불법건축물 확인 유무', verifyingBtn[2]),
                  ])),
        ],
      ),
    );
  }

  Row certification(String s, btnClick verifyingBtn) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Text(s),
        ),
        Flexible(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      verifyingBtn.btn1 = !verifyingBtn.btn1;
                      verifyingBtn.btn1
                          ? verifyingBtn.color1 = Colors.blue
                          : verifyingBtn.color1 = Colors.grey;
                    });
                  },
                  color: verifyingBtn.color1,
                  icon: Icon(Icons.check)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      verifyingBtn.btn2 = !verifyingBtn.btn2;
                      verifyingBtn.btn2
                          ? verifyingBtn.color2 = Colors.red
                          : verifyingBtn.color2 = Colors.grey;
                    });
                  },
                  color: verifyingBtn.color2,
                  icon: Icon(Icons.close)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      verifyingBtn.btn3 = !verifyingBtn.btn3;
                      verifyingBtn.btn3
                          ? verifyingBtn.color3 = Colors.yellow
                          : verifyingBtn.color3 = Colors.grey;
                    });
                  },
                  color: verifyingBtn.color3,
                  icon: Icon(Icons.question_mark))
            ],
          ),
        )
      ],
    );
  }

  Column uploadPic() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              Text(
                '사진을 올려주세요(선택)',
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '사진은 5개까지 선택가능합니다',
                style: TextStyle(color: Colors.blue, fontSize: 10),
              )
            ],
          ),
        ),
        imageList.isEmpty
            ? DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(8),
                strokeWidth: 3,
                color: Colors.grey,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Center(
                      child: IconButton(
                          iconSize: 40,
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.blue,
                          ))),
                ),
              )
            : Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < imageList.length; i++) ...[
                          showImage(imageList[i])
                        ]
                      ],
                    ),
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(8),
                    strokeWidth: 3,
                    color: Colors.grey,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: IconButton(
                          iconSize: 40,
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.blue,
                          )),
                    ),
                  )
                ],
              )
      ],
    );
  }

  // 이미지를 보여주는 위젯
  Widget showImage(imageList) {
    return Container(
        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
        color: Color.fromARGB(255, 239, 238, 238),
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.width * 0.2,
        child: Image.file(imageList));
  }

  Container goodOrBad(
      BuildContext context, String s, TextEditingController textCtrl) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              '$s (50자 이상)',
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
                color: Color.fromRGBO(99, 99, 99, 0.05),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              maxLines: 5,
              maxLength: 1000,
              controller: textCtrl,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none, //검색 아이콘 추가
                  contentPadding:
                      EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 5),
                  hintText: '우리 집의 $s을 이야기해주세요'),
            ),
          ),
        ],
      ),
    );
  }

  Container ratingBar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(99, 99, 99, 0.05),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        if (rating <= 1) {
                          text = "최악이에요";
                          icon = Icon(
                            Icons.sentiment_very_dissatisfied,
                            color: Colors.black,
                          );
                        } else if (rating <= 2) {
                          text = "별로예요";
                          icon = Icon(Icons.sentiment_dissatisfied,
                              color: Colors.red);
                        } else if (rating <= 3) {
                          text = "보통이에요";
                          icon = Icon(Icons.sentiment_neutral,
                              color: Colors.yellow);
                        } else if (rating <= 4) {
                          text = "만족해요";
                          icon = Icon(Icons.sentiment_satisfied,
                              color: Colors.green);
                        } else {
                          text = "아주 좋아요";
                          icon = Icon(
                            Icons.sentiment_very_satisfied,
                            color: Colors.blue,
                          );
                        }
                      });
                    },
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      margin: EdgeInsets.only(right: 5), child: Text(text)),
                  icon
                ]),
              ],
            ),
          ),
          //
        ],
      ),
    );
  }
}
