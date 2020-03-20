///
/// Author: liyanjun43@jd.com
/// Date: 2019-11-24 21:58:51
/// LastEditTime: 2019-12-30 16:16:26
/// FilePath: /flutterDemo/lib/bloc/page/bloc_home.dart
/// Description: 
///
import 'package:flutter/material.dart';
import 'package:helloworld/bloc/page/strem_demo_main.dart';
import 'package:helloworld/bloc/scoped_model/scoped_home.dart';
import 'package:helloworld/utils/utility.dart';
class  BlocHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('状态管理'),),
      body: ListView(
        children: <Widget>[
          getLines('Stream', context: context,ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StreamHome(),
                ));
          }),
           getLines('scoped_model', context: context,ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScopedHomePage(),
                ));
          }),

        ],
      ) ,
    );
  }
}
