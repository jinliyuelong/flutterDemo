import 'package:flutter/material.dart';
import 'package:helloworld/utils/utility.dart';
import '1.main的nav1.dart';
import '1.main的nav2传递参数1.dart';
import '1main的nav传递回传数据.dart';
import 'bottom_navigation/bottom_navigation_widget.dart';

class MyNavigationPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('导航的学习'),),
      body: ListView(
          children: <Widget>[
            getLines('基础跳转', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyfristScreen(),
                  ));
            }),
             getLines('基础跳转携带参数', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MynavigationPrams(),
                  ));
            }),
             getLines('基础跳转回传参数', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyRetunParamsFirstPage(),
                  ));
            }),
             getLines('底部tab', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigationWidget(),
                  ));
            })
          ],
        ) ,
    );
  }
}