import 'package:flutter/material.dart';
import './mainpage//home.dart';
import 'map.dart';
import './roomInfo/room.dart';
import './board/board.dart';
import './writing/writingroom.dart';
import './writing/writingboard.dart';
import './mypage/mypage.dart';

void main() {
  runApp(const Viewing());
}

class Viewing extends StatelessWidget {
  const Viewing({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIdx = 0;
  final _pages = [
    MainHome(),
    // Map(),
    Map(),
    BoardPage(),
    MyPage()
  ];

  late List<GlobalKey<NavigatorState>> _navigatorKeyList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatorKeyList =
        List.generate(_pages.length, (index) => GlobalKey<NavigatorState>());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return !(await _navigatorKeyList[currentIdx]
              .currentState!
              .maybePop());
        },
        child: Scaffold(
          body: Column(
            children: [
              currentIdx != 2
                  ? Flexible(
                      flex: 1, fit: FlexFit.tight, child: AddressSearch())
                  : Container(),
              Expanded(
                flex: 8,
                child: IndexedStack(
                  index: currentIdx,
                  children: _pages.map((page) {
                    int index = _pages.indexOf(page);
                    return Navigator(
                      key: _navigatorKeyList[index],
                      onGenerateRoute: (_) {
                        return MaterialPageRoute(builder: (context) => page);
                      },
                    );
                  }).toList(),
                ),
              )
            ],
          ),
          floatingActionButton: floatingButton(context),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIdx,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                currentIdx = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.map_outlined,
                ),
                label: '지도',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.edit_note_outlined,
                ),
                label: '게시판',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
                label: '내정보',
              ),
            ],
            unselectedItemColor: Colors.black,
            selectedItemColor: Color.fromRGBO(255, 99, 99, 1),
            unselectedLabelStyle: TextStyle(color: Colors.black),
            selectedLabelStyle:
                TextStyle(color: Color.fromRGBO(255, 99, 99, 1)),
          ),
        ));
  }

  FloatingActionButton floatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          backgroundColor: Color.fromARGB(255, 31, 31, 31),
          shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          builder: (BuildContext context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: <Widget>[
                  //상단 x 버튼
                  Row(
                    children: [
                      Expanded(child: Container()),
                      IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: Color.fromRGBO(255, 99, 99, 1),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  Flexible(flex: 5, child: writingPage(context, num: 1)),
                  Flexible(flex: 5, child: writingPage(context, num: 2)),
                ],
              ),
            );
          },
        ).then((value) {
          setState(() {});
        });
      },
      backgroundColor: Color.fromRGBO(255, 99, 99, 1),
      child: const Icon(
        Icons.edit_note_outlined,
        color: Colors.white,
      ),
    );
  }

  InkWell writingPage(BuildContext context, {required int num}) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: Color.fromRGBO(255, 99, 99, 1), width: 2))),
        child: Center(
          child: Text(
            num == 1 ? "게시판 글쓰기" : "방정보 글쓰기",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: Color.fromRGBO(255, 99, 99, 1)),
          ),
        ),
      ),
      onTap: () {
        if (num == 1) {
          //게시판 글쓰기
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WritingBoard()));
        } else if (num == 2) {
          //방정보 글쓰기
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WritingRoom()));
        }
      },
    );
  }
}

class MaingPage extends StatefulWidget {
  const MaingPage({Key? key}) : super(key: key);

  @override
  State<MaingPage> createState() => _MaingPageState();
}

class _MaingPageState extends State<MaingPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AddressSearch extends StatelessWidget {
  const AddressSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.grey,
        width: 2.0,
      ))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: Offset(0, 7))
            ]),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Flexible(
            flex: 8,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '검색할 주소를 입력하세요',
              ),
            ),
          ),
          Expanded(
              child: Icon(
            Icons.search,
            color: Color.fromRGBO(255, 99, 99, 1),
          ))
        ]),
      ),
    );
  }
}

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
      child: const Text('Setting'),
      // onPressed: () => Navigator.pushNamed(context, '/second'),
      onPressed: () {},
    ));
  }
}
