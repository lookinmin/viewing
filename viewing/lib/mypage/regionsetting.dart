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
        child: TextButton(
          onPressed: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => KpostalView(
                    callback: (Kpostal result) {
                      print(result.address);
                    },
                  ),
                ));
          },
          child: Text('Search!'),
        ),
      ),
    );
  }
}
