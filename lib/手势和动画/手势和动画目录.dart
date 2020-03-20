///
/// Author: 1254463047@qq.com
/// Date: 2019-11-26 16:41:20
/// LastEditTime: 2019-12-30 16:26:16
/// FilePath: /flutterDemo/lib/手势和动画/手势和动画目录.dart
/// Description: 
///
import 'package:flutter/material.dart';
import 'package:helloworld/utils/utility.dart';
import 'package:helloworld/手势和动画/手势demo.dart';
import 'package:helloworld/手势和动画/动画demo.dart';
import 'package:helloworld/手势和动画/animation_widget_动画.dart';
import 'package:helloworld/手势和动画/staggered_animations动画.dart';
import 'package:helloworld/手势和动画/hero动画.dart';
class GuestureCatlog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势和动画'),
      ),
      body: ListView(
        children: <Widget>[
          getLines('手势demo', context: context, ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GestureDemoPage(),
                ));
          }),
          getLines('动画demo', context: context, ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimationDemoPage(),
                ));
          }),
           getLines('animation_widget_动画', context: context, ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimationWidget(),
                ));
          }),
           getLines('staggered_animations动画', context: context, ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StaggeredAnimationsDemoPage(),
                ));
          }),
           getLines('hero动画', context: context, ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HeroAnimationPage(),
                ));
          }),
        ],
      ),
    );
  }
}
