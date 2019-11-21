import 'package:flutter/material.dart';
import 'package:helloworld/utils/utility.dart';
import '毛玻璃特效.dart';

class SpecialEfficiencyViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('导航的学习'),),
      body: ListView(
          children: <Widget>[
            getLines('毛玻璃特效', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FrostedGlassDemo(),
                  ));
            })
          ],
        ) ,
    );
  }
}