///
/// Author: 1254463047@qq.com
/// Date: 2019-12-05 22:37:40
/// LastEditTime: 2020-03-28 23:43:09
/// FilePath: /flutterDemo/lib/原理/原理homo.dart
/// Description: 
///
import 'package:flutter/material.dart';
import 'package:helloworld/%E5%8E%9F%E7%90%86/keys/key_%E5%AF%BC%E8%88%AA.dart';
import 'package:helloworld/utils/utility.dart';
import 'state生命周期.dart';

class FundamentalsHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('原理的学习'),),
      body: ListView(
          children: <Widget>[
            getLines('state生命周期', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StatePeriodWidget(),
                  ));
            }),
               getLines('key', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KeyNavPage(),
                  ));
            })
          ],
        ) ,
    );
  }
}