import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/utils/utility.dart';
import 'package:helloworld/Slide/singleScrollView.dart';
import 'package:helloworld/Slide/ListView.dart';
import 'package:helloworld/Slide/custom_scroll_main.dart';
import 'package:helloworld/Slide/scroll_controller_main.dart';
import 'package:helloworld/Slide/sliver_appbar_main.dart';
import 'package:helloworld/Slide/sliver_persistent_main.dart';
import 'package:helloworld/Slide/nested_scroll_main.dart';
class MySlideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('滑动组件的学习'),),
      body: ListView(
        children: <Widget>[
          getLines('singleSrollView', context: context,ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MySingleSrollView(),
                ));
          }),
          getLines('listView', context: context,ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyListView(),
                ));
          }),
          getLines('CustomScrollDemoPage', context: context,ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomScrollDemoPage(),
                ));
          }),
          getLines('ScrollControllerDemoPage', context: context,ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScrollControllerDemoPage(),
                ));
          }),
          getLines('SliverDemo', context: context,ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SliverBarDemo(),
                ));
          }),
          getLines('SliverHeaderDemo', context: context,ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SliverHeaderDemoPage(),
                ));
          }),
          getLines('NestedScrollView', context: context,ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NestedScrollDemoPage(),
                ));
          }),
        ],
      ) ,
    );
  }
}
