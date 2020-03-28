///
/// Author: 1254463047@qq.com
/// Date: 2020-03-28 23:19:49
/// LastEditTime: 2020-03-28 23:25:06
/// FilePath: /flutterDemo/lib/原理/keys/key_导航.dart
/// Description: 
///
import 'package:flutter/material.dart';
import 'package:helloworld/%E5%8E%9F%E7%90%86/keys/sample2.dart';
import 'package:helloworld/%E5%8E%9F%E7%90%86/keys/sample3.dart';
import 'package:helloworld/%E5%8E%9F%E7%90%86/keys/sample4.dart';
import 'package:helloworld/utils/utility.dart';

class KeyNavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('原理的学习'),),
      body: ListView(
          children: <Widget>[
            getLines('Sample2', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sample2(),
                  ));
            }),
             getLines('Sample3', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sample3(),
                  ));
            }),
             getLines('Sample4', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sample4(),
                  ));
            })
          ],
        ) ,
    );
  }
}