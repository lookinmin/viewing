import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  const Review({Key? key, required String this.name, required String this.content, required String this.time}) : super(key: key);
  final name;
  final content;
  final time;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        ListTile(
          dense:true,
          leading:CircleAvatar(
              backgroundColor:Color.fromRGBO(0, 0, 0, 0),
              child:CircleAvatar(
                radius: 15,
                backgroundColor:Colors.grey[200],
                child:Icon(
                  Icons.person,
                  color:Colors.grey[500],
                  size:20,
                ),
              ),
            ),
            title:Text(name),
            subtitle:Text(time),
            // trailing: IconButton(
            //   // 나중에 댓글 삭제하기
            //   onPressed: null, 
            //   icon: Icon(Icons.close),)
        ),
        Container(
          padding:EdgeInsets.fromLTRB(20, 0, 20, 0),
          child:Row(
            mainAxisAlignment:MainAxisAlignment.start,
            children:[
              Text(
                content,
                style:TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                )
              )
            ]
          )
        ),
        SizedBox(height:10),
        Divider(thickness:1,indent: 10,endIndent: 10,),
      ]
    );
  }
}

String time(){
  var now = new DateTime.now();
  String formatDate = DateFormat('yy/MM/dd - HH:mm:ss').format(now);
  return formatDate;
}