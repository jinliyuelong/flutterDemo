
import 'package:flutter/material.dart';
import 'package:helloworld/utils/utility.dart';
import 'package:helloworld/数据持久化/文件io.dart';
import 'package:helloworld/数据持久化/SharedPreferences.dart';

class DataPersistence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('数据持久化'),),
      body: ListView(
          children: <Widget>[
            getLines('io', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataPersistenceDemoPage(),
                  ));
            }),
             getLines('SharePreferncesPage', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataSharePreferncesPage(),
                  ));
            }),
          ],
        ) ,
    );
  }
}