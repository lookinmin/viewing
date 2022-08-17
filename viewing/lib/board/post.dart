import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import './review.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:IconThemeData(color:Colors.grey),
        title: const Text(
          "Viewing 게시판",
          style: TextStyle(
              color: Colors.black,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.white,
        centerTitle: true, // 글자 가운데 정렬
        elevation: 0, // 그림자 제거
        // actions:[
        //   IconButton(icon:Icon(Icons.search,color:Colors.grey),
        //   onPressed:(){
        //     Navigator.push(
        //       context, 
        //       MaterialPageRoute(builder:(context)=>SearchPage()));
        //   }),
        // ]
      ),
      body:Post(),
      bottomSheet: Reviewinput(),
      );
  }
}

class Reviewinput extends StatelessWidget {
  const Reviewinput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      margin:EdgeInsets.fromLTRB(10, 5, 10, 5),
      child:TextFormField(
        decoration: InputDecoration(
          hintText:'댓글을 입력하세요.',
          hintStyle:TextStyle(
            color:Colors.grey[600],
            fontSize:15,
          ),
          enabledBorder:UnderlineInputBorder(
            borderSide:BorderSide(color:Colors.grey,),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder:UnderlineInputBorder(
            borderSide:BorderSide(color:Colors.white,),
          ),
          filled:true,
          // prefixIcon:Icon(Icons.search,color:Colors.grey,size:30),
          suffixIcon:IconButton(icon:Icon(Icons.send_sharp ,color:Colors.red[700],),onPressed:null)
        ),
        style:TextStyle(
         fontSize:18,
          color:Colors.black
        ),
        // 검색어 입력후 DB에서 일치하는 결과값 가져올것
        onFieldSubmitted:null,
      ),
    );
  }
}

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:Column(
        children: <Widget>[
          // 이름, 아이콘, 시간
          ListTile(
            leading:CircleAvatar(
              backgroundColor:Colors.white,
              child:CircleAvatar(
                backgroundColor:Colors.grey[200],
                child:Icon(
                  Icons.person,
                  color:Colors.grey[500],
                ),
              ),
            ),
            title:Text('익명'),
            subtitle:Text(time())
          ),
          // 제목
          Container(
            padding:EdgeInsets.fromLTRB(20, 5, 20, 5),
            width:double.infinity,
            child:Text(
              "제목이 들어갈고임제목젬곧ㅈ곰곡",
              style:TextStyle(fontWeight:FontWeight.bold),
              textAlign:TextAlign.start,
              textScaleFactor: 1.3,
            ),
          ),
          // 내용
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child:Align(
              alignment:Alignment.topLeft,
              child:Text("내용들어갈거임"),
            )
          ),
          // 좋아요, 리뷰
          Container(
            padding:EdgeInsets.fromLTRB(20, 10, 20, 5),
            width:double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.pink[400],
                  size: 15.0,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: Text("하트개수",
                    style: TextStyle(
                      fontSize: 13,
                  )),
                ),
                Icon(
                  Icons.wechat,
                  color: Colors.yellow[600],
                  size:15.0,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text("리뷰개수",
                    style: TextStyle(
                      fontSize: 13,
                  )),
                ),
              ],
            ),
          ),
          Container(
            padding:EdgeInsets.fromLTRB(20, 10, 20, 5), 
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                OutlinedButton.icon(
                  onPressed: null, 
                  style:OutlinedButton.styleFrom(
                    primary:Colors.black,
                  ),
                  icon:Icon(
                    Icons.favorite,
                    color:Colors.pink[400],
                    size:15.0
                  ),
                  label:Text(
                    "좋아요"
                    ,style: TextStyle(
                      fontSize:13,
                      color: Colors.black,
                    ),)
                ),
              ]
            ),
          ),
          SizedBox(
            height:1
          ),
          Divider(
            thickness:1,
          ),
          // 댓글
          Column(
            children:[
              Column(
                children:[
                  // 댓글 잇는만큼 받아와서 띄우기
                  Review(),
                  Review(),
                  Review(),
                  Review(),
                  Review(),
                  Review(),
                ],
              ),
              SizedBox(height:50),
            ],
          ),
        ],
      )
    );
  }
}

String time(){
  var now = new DateTime.now();
  String formatDate = DateFormat('yy/MM/dd - HH:mm:ss').format(now);
  return formatDate;
}