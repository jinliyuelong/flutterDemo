import 'package:flutter/material.dart';
import '1.main的Text.dart';
import '1.main的containner和text.dart';
import '2.main的image.dart';
import '4.main的横向的listView和嵌套.dart';
import '4.main的纵向的listview.dart';
import '5.main的GrideView.dart';
import '6.main的Row布局.dart';
import '7.main的Column布局.dart';
import '8.main的Stack布局.dart';
import '9.main的卡片组件.dart';
import '10.main的官方demo.dart';
import 'package:helloworld/utils/utility.dart';

class MyBasicLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('flutter学习demo'),
        ),
        body: ListView(
          children: <Widget>[
            getLines('Text学习', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyTextPractice(),
                  ));
            }),
             getLines('Containner学习', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyContainer(),
                  ));
            }),
             getLines('Image学习', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyImage(),
                  ));
            }),
             getLines('纵向tabvliew', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyVerticallylistview(),
                  ));
            }),
             getLines('横向tabvliew', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHorizontallyListview(),
                  ));
            }),
             getLines('gradView1', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MYGridView1(),
                  ));
            }),
             getLines('gradView2', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyGridView2(),
                  ));
            }),
             getLines('row学习', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyRow(),
                  ));
            }), 
            getLines('row学习1', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyRow1(),
                  ));
            }),
             getLines('Column学习', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyColumn(),
                  ));
            }), getLines('Column学习1', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyColumn1(),
                  ));
            }), getLines('Stack学习', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyStackView(),
                  ));
            }), getLines('cardView', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyCardView(),
                  ));
            }), getLines('官网的布局', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyOfficialScreen(),
                  ));
            }),
          ],
        ),
    );
  }
}
