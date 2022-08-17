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
          "Viewing 게시판",
          style: TextStyle(
              color: Colors.black,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.white,
        leading: Container(), //Appbar의 뒤로가기 버튼 지우기
        centerTitle: true, // 글자 가운데 정렬
        elevation: 0, // 그림자 제거
        actions:[
          IconButton(icon:Icon(Icons.search,color:Colors.grey),
          onPressed:(){
            Navigator.push(
              context, 
              MaterialPageRoute(builder:(context)=>SearchPage()));
          }),
        ]
      ),
      body: Column(
        children: [
          Flexible(flex:1,child:DropBox()),
          Flexible(flex: 1, child: Hashtag()),
          Flexible(flex: 9, child: Board())
        ],
      ),
    );
  }
}

class DropBox extends StatelessWidget{
  const DropBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding:EdgeInsets.fromLTRB(0, 0, 10, 5),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
            Container(child:Dropdown(),)
          ]
        )
    );
  }
}

class Dropdown extends StatefulWidget{
  const Dropdown({Key? key}) : super(key: key);

  @override
  _DropdownState createState()=>_DropdownState();
}

class _DropdownState extends State<Dropdown>{
  // const Dropbox({Key? key}) : super(key: key);
  List<String> dropdownList = ['최근리뷰순','추천순','댓글순'];
  String selectedDropdown = '최근리뷰순';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: selectedDropdown,
        items:dropdownList.map(
          (String item){
            return DropdownMenuItem<String>(
              value: item,
              child:Text('$item'),
              );
          }).toList(),
          onChanged:(dynamic value){
            setState((){
              selectedDropdown = value;
            });
        }
      );
  }
}

class Hashtag extends StatelessWidget {
  const Hashtag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hashtaglist.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(250, 245, 228, 1.0),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(hashtaglist[index],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
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
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: ListView.builder(
            itemCount: boardsList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap:(){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder:(context)=>PostPage()));
                },
                child:Container(
                // 게시글 하나
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                height: 150,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(99, 99, 99, 0.05),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(boardsList[index].name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                )),
                            Text(boardsList[index].date,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        child: Text(boardsList[index].title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            )),
                      ),
                      Container(
                          child: Row(
                        children: [
                          Icon(
                            Icons.subdirectory_arrow_right,
                            size: 15.0,
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(boardsList[index].content,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  )))
                        ],
                      )),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              child: Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.pink[400],
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(boardsList[index].heartnum,
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                              )
                            ],
                          )),
                          Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.wechat,
                                    color: Colors.yellow[600],
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(boardsList[index].reviewnum,
                                        style: TextStyle(
                                          fontSize: 14,
                                        )),
                                  )
                                ],
                              )),
                        ],
                      ))
                    ]),
              ));
            })
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
  final String heartnum;
  final String reviewnum;
  final String date;
}

const boardsList = [
  BoardModel("익명", "개신동 이사할만한 원룸 추천", "월세 30미만 집", "1", "2", "2022.06.17"),
  BoardModel("익명", "이 벌레 뭔지 아시는분...", "집에 벌레가 나왔어요...", "0", "5", "2022.06.19"),
  BoardModel("익명", "22시 치킨 시키실분", "치킨 같이 시키실 분", "10", "17", "2022.06.18"),
  BoardModel("익명", "햇반 나눔 가능하신 분", "개신동 햇반 하나만", "13", "11", "2022.06.20"),
  BoardModel("익명", "햇반 나눔 가능하신 분", "개신동 햇반 하나만", "13", "11", "2022.06.20"),
];

const hashtaglist = ["# 치킨", "# 배달", "# 햇반", "# 산책", "# 공동구매", "# 바퀴벌레"];