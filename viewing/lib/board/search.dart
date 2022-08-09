import 'package:flutter/material.dart';

void main() {
  runApp(const SearchPage());
}

class SearchPage extends StatelessWidget{
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchPageHeader(),
      body:displayNoSearchResultScreen(),
    );
  }
}

AppBar searchPageHeader(){
    return AppBar(
      iconTheme:IconThemeData(color:Colors.grey),
      backgroundColor: Colors.white,
      title:TextFormField(
      decoration: InputDecoration(
        hintText:'글 제목, 내용, 해시태그',
        hintStyle:TextStyle(
          color:Colors.grey,
        ),
        enabledBorder:UnderlineInputBorder(
        borderSide:BorderSide(color:Colors.grey,),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder:UnderlineInputBorder(
        borderSide:BorderSide(color:Colors.white,),
      ),
      filled:true,
      prefixIcon:Icon(Icons.search,color:Colors.grey,size:30),
      suffixIcon:IconButton(icon:Icon(Icons.clear,color:Colors.grey,),onPressed:null)
      ),
      style:TextStyle(
      fontSize:18,
      color:Colors.white
    ),
    // 검색어 입력후 DB에서 일치하는 결과값 가져올것
    onFieldSubmitted:null,
    ),
    );
}

class displayNoSearchResultScreen extends StatelessWidget{
  const displayNoSearchResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(
        child: ListView(
          shrinkWrap:true,
          children:<Widget>[
            Icon(Icons.search, color:Colors.grey, size:130),
            Text(
              '게시판의 글을 검색해보세요',
              textAlign:TextAlign.center,
              style:TextStyle(
                color:Colors.grey,
                fontWeight:FontWeight.w500,
                fontSize:25
              )
            )
          ]
        ),
        )
    );
  }
}