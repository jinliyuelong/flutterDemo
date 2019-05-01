import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'layout/basicsLayout.dart';
import 'navigation/navigationPractice.dart';
import 'utils/utility.dart';
void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter学习demo',
      theme: ThemeData.light(),
      home: MyHomeScreen(),
    ));
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}


class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('flutter学习demo'),
        ),
        body: ListView(
          children: <Widget>[
            getLines('基础的layout学习', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyBasicLayoutScreen(),
                  ));
            }),
             getLines('导航的学习', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyNavigationPractice(),
                  ));
            }),
          ],
        ),
    );
  }
}
