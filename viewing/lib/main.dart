import 'package:flutter/material.dart';
import 'package:viewing/writing/roomreviewfirst.dart';
import './mainpage//home.dart';
import 'map.dart';
import './roomInfo/room.dart';
import './board/board.dart';
import './writing/roomreviewfirst.dart';
import './writing/writingboard.dart';
import './mypage/mypage.dart';
import './startpage/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:kpostal/kpostal.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

void main() {
  runApp(const Viewing());
}

class Viewing extends StatelessWidget {
  const Viewing({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // 투명색
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {'/': (context) => Splash()},
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
      //home: const Home(),
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
  final _pages = [MainHome(), Map(), BoardPage(), MyPage()];

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
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return WillPopScope(
        onWillPop: () async {
          return !(await _navigatorKeyList[currentIdx]
              .currentState!
              .maybePop());
        },
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height:
                    (currentIdx != 2 && currentIdx != 3) ? statusBarHeight : 0,
              ),
              (currentIdx != 2 && currentIdx != 3)
                  ? Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: currentIdx == 0
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Container(
                                      padding: EdgeInsets.only(top: 5),
                                      margin: EdgeInsets.only(left: 10),
                                      child: Image.asset(
                                          'assets/images/logo_pink.png')),
                                ),
                                Expanded(flex: 9, child: AddressSearch())
                              ],
                            )
                          : AddressSearch())
                  : Container(),
              Expanded(
                flex: 10,
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
          floatingActionButton:
              currentIdx == 0 ? floatingButton(context) : Container(),
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

  Widget floatingButton(BuildContext context) {
    return SpeedDial(
      child: Icon(Icons.mode),
      closedForegroundColor: Color.fromRGBO(255, 99, 99, 1),
      openForegroundColor: Colors.white,
      closedBackgroundColor: Colors.white,
      openBackgroundColor: Color.fromRGBO(255, 99, 99, 1),
      labelsBackgroundColor: Colors.white,
      labelsStyle: TextStyle(color: Colors.black),
      speedDialChildren: <SpeedDialChild>[
        SpeedDialChild(
          child: Icon(Icons.edit_note),
          foregroundColor: Colors.white,
          backgroundColor: Color.fromRGBO(255, 99, 99, 1),
          label: '게시판 글쓰기',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WritingBoard()));
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.post_add),
          foregroundColor: Color.fromRGBO(255, 99, 99, 1),
          backgroundColor: Colors.white,
          label: '방정보 글쓰기',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WritingRoom()));
          },
        ),
      ],
    );
  }

  // InkWell writingPage(BuildContext context, {required int num}) {
  //   return InkWell(
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       decoration: BoxDecoration(
  //           border: Border(
  //               top: BorderSide(
  //                   color: Color.fromRGBO(255, 99, 99, 1), width: 2))),
  //       child: Center(
  //         child: Text(
  //           num == 1 ? "게시판 글쓰기" : "방정보 글쓰기",
  //           style: TextStyle(
  //               fontWeight: FontWeight.w900,
  //               fontSize: 16,
  //               color: Color.fromRGBO(255, 99, 99, 1)),
  //         ),
  //       ),
  //     ),
  //     onTap: () {
  //       if (num == 1) {
  //         //게시판 글쓰기
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => WritingBoard()));
  //       } else if (num == 2) {
  //         //방정보 글쓰기
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => WritingRoom()));
  //       }
  //     },
  //   );
  // }
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
      margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        TextButton(
          onPressed: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => KpostalView(
                    useLocalServer: true,
                    localPort: 7001,
                    callback: (Kpostal result) {
                      print(result.address);
                    },
                  ),
                ));
          },
          child: Text(
            '검색할 주소를 입력하세요',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Icon(
          Icons.search,
          color: Color.fromRGBO(255, 99, 99, 1),
        )
      ]),
    );
  }
}
