import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';

class RegionSetting extends StatefulWidget {
  const RegionSetting({Key? key}) : super(key: key);

  @override
  State<RegionSetting> createState() => _RegionSettingState();
}

class _RegionSettingState extends State<RegionSetting> {
  var address = '청주시 흥덕구 복대동';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '관심 지역 설정',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          toolbarHeight: 50.0,
          elevation: 1.0, // 그림자 제거
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.grey,
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                //dense: true,
                minLeadingWidth: 0,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '현재 관심 지역',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 25,
                          color: Color.fromARGB(255, 255, 99, 99),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(address),
                      ],
                    )
                  ],
                ),
              ),
              Divider(),
              ListTile(
                  //dense: true,
                  minLeadingWidth: 0,
                  title: Text('관심 지역 변경'),
                  trailing: Icon(Icons.chevron_right),
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
                  }),
            ],
          ),
        ));
  }
}
