///
/// Author: 1254463047@qq.com
/// Date: 2020-04-14 14:41:47
/// LastEditTime: 2020-04-14 15:34:37
/// FilePath: /flutterDemo/lib/三方库/三方库目录.dart
/// Description: 三方库的目录
///
///
import 'package:flutter/material.dart';
import 'package:helloworld/%E4%B8%89%E6%96%B9%E5%BA%93/visibility_detector_demo.dart';
import 'package:helloworld/三方库/scrollable_positioned_list_demo.dart';
import 'package:helloworld/utils/utility.dart';
import 'package:helloworld/三方库/linked_scroll_controller_demo.dart';

class ThirdHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('三方库'),
      ),
      body: ListView(
        children: <Widget>[
          getLines('linked_scroll_controller', context: context, ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LinkedScrollables(),
                ));
          }),
             getLines('scrollable_positioned_list_demo', context: context, ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AttestationRebindPage(),
                ));
          }),
          getLines('visibility_detector_demo', context: context, ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VisibilityDetectorDemo(),
                ));
          }),

          
        ],
      ),
    );
  }
}
