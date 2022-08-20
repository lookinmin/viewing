import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';

class RegionSetting extends StatefulWidget {
  const RegionSetting({Key? key}) : super(key: key);

  @override
  State<RegionSetting> createState() => _RegionSettingState();
}

class _RegionSettingState extends State<RegionSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '관심 지역 설정',
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
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  '주소지',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                ),
              ),
              InkWell(
                onTap: () async {
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
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(99, 99, 99, 0.05),
                      borderRadius: BorderRadius.circular(8)),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 9,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('주소를 검색하세요'),
                        ),
                      ),
                      Expanded(flex: 1, child: Icon(Icons.search))
                    ],
                  ),
                ),
              )
            ],
      ),
        )
    );
  }
}


