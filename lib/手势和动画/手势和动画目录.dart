import 'package:flutter/material.dart';
import 'package:helloworld/utils/utility.dart';
import 'package:helloworld/手势和动画/手势demo.dart';

class GuestureCatlog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势和动画'),
      ),
      body: ListView(
          children: <Widget>[
            getLines('手势demo', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GestureDemoPage(),
                  ));
            }),
             
          ],
        ),
    );
  }
}