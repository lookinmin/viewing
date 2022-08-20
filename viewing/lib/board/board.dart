import 'package:flutter/material.dart';
import './search.dart';
import './post.dart';

void main() {
  runApp(const BoardPage());
}

class BoardPage extends StatelessWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "게시판",
            style: TextStyle(
              fontSize: 18.0,
              letterSpacing: 1.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          automaticallyImplyLeading: false,
          leading: null,
          backgroundColor: Colors.white,
          elevation: 1.0, // 그림자 제거
          toolbarHeight: 50.0,
          actions: [
            IconButton(
                icon: Icon(Icons.search, color: Colors.grey),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                }),
            IconButton(
                icon: Icon(Icons.more_vert, color: Colors.grey),
                onPressed: () {
                  // 정렬 BottomSheet
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                            height: 200,
                            color: Color(0xFF737373),
                            child: Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    )),
                                child: Column(children: [
                                  // X 버튼
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 5, 10, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            icon: Icon(Icons.close,
                                                color: Colors.grey))
                                      ],
                                    ),
                                  ),
                                  // 정렬
                                  Divider(
                                    thickness: 1,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        print("최근 리뷰순");
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          '최근 리뷰순',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        print("추천순");
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          '추천순',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        print("댓글순");
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          '댓글순',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ])));
                      });
                }),
          ]),
      body: Board(),
    );
  }
}

class Hashtag extends StatelessWidget {
  const Hashtag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height:60,
        margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hashtaglist.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(250, 245, 228, 1.0),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(hashtaglist[index],
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(255, 99, 99, 1.0),
                    )));
          },
        ));
  }
}

class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      width:double.infinity,
      height:double.infinity,
      child:SingleChildScrollView(
        child:Column(
          children: [
            // 해시태그
            Hashtag(),
            Divider(thickness:1,indent: 10,endIndent: 10,),
            // 게시글
            for(int i=0;i<boardsList.length;i++)
              BoardContent(name:boardsList[i].name,title:boardsList[i].title,content:boardsList[i].content,heartnum:boardsList[i].heartnum,reviewnum:boardsList[i].reviewnum,date:boardsList[i].date),
          ],
        )
      )
    );
  }
}

class BoardContent extends StatelessWidget {
  const BoardContent({Key? key, required String this.name, required String this.title, required String this.content, required int this.heartnum, required int this.reviewnum, required String this.date}) : super(key: key);
  final name;
  final title;
  final content;
  final heartnum;
  final reviewnum;
  final date;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.push(context,MaterialPageRoute(builder:(context)=>PostPage()));
      },
      child:Container(
        margin:EdgeInsets.fromLTRB(15, 5, 15, 10),
        padding:EdgeInsets.fromLTRB(15,10,15,10),
        // height:150,
        decoration:BoxDecoration(
          color:Color.fromRGBO(99,99,99,0.05),
          borderRadius:BorderRadius.circular(15),
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text(name,style:TextStyle(
                    fontSize:13,
                    color:Colors.grey,
                  )),
                  Text(date,style:TextStyle(
                    fontSize:13,
                    color:Colors.grey,
                  ))
                ]
              )
            ),
            Padding(padding: EdgeInsets.only(top: 10),
            child:Text(title,style:TextStyle(
              fontSize:16,
              fontWeight:FontWeight.bold,
            )),),
            Padding(padding: EdgeInsets.only(top:5),
            child:Text(content,style:TextStyle(
              fontSize:15,
              color:Colors.grey,
            ))),
            Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  Container(
                    child:Row(
                      children:[
                        Icon(Icons.favorite,color:Colors.pink[400],size:15,),
                        Container(margin:EdgeInsets.fromLTRB(5,0,10,0),
                        child:Text(heartnum.toString(),style:TextStyle(fontSize:13))),
                        Icon(Icons.wechat,color:Colors.yellow[600]),
                        Container(margin:EdgeInsets.fromLTRB(5,0,0,0),
                        child:Text(reviewnum.toString(),style:TextStyle(fontSize:13))),
                      ]
                    ),
                  )
                ]
              ),
            )
          ]
        )

      )
    );
  }
}
Widget logo() {
  return Image.asset(
    'images/mark.jpg',
  );
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

const boardsList = [
  BoardModel("익명", "같이 볼링치러 가실 분~", "같이 볼링치러 가실 대학생 친구 구해요~ 저는 보통 100정도 나옵니다 !", 1, 2, "2022.08.19"),
  BoardModel("익명", "일본어 스터디 모임 있을까요?.", "혹시 일본어 스터디 모임 있을까요? 예전에 배웠는데 안쓰니 기억이 안나서요ㅜㅜ 있으면 같이 스터디해요~", 0, 5, "2022.06.19"),
  BoardModel("익명", "동네 친구 하실 분~", "충북대 중문쪽 산책하고 코노가고 영화, 볼링, 카페 등등 좋아하시는 분 !", 10, 17, "2022.08.19"),
  BoardModel("익명", "청소 업체 추천 받아요ㅜㅜ", "복대동 사창동 근처 원룸 거주청소 하시는 분이나 업체 추천 부탁드려요 !", 1, 3, "2022.08.19"),
  BoardModel("익명", "정문~서문쪽 한 달 양도 받아요", "한 달정도 거주하면 좋을거같은데 댓글 부탁드려요~ 가격은 35~40까지 생각중입니다. 비흡연자이고 깔끔하게 사용할 수 있습니다.", 0, 2, "2022.08.19"),
  BoardModel("익명", "콜라 사가실 분", "6캔 2500원이요 정문이에요", 1, 10, "2022.08.18"),
  BoardModel("익명", "사탕 공동구매 하실 분 2분 구해요", "맛있어서 사려고 하는데 양이 너무 많아서요 ㅠㅠ 3띵 하실 분들 계시나요... 제가 3등분으로 분류할게요...", 2, 5, "2022.08.18"),
];

const hashtaglist = ["# 치킨", "# 배달", "# 햇반", "# 산책", "# 공동구매", "# 바퀴벌레"];
