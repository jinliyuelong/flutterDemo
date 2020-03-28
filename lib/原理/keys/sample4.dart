import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Author: 1254463047@qq.com
/// Date: 2020-03-28 23:21:36
/// LastEditTime: 2020-03-28 23:21:37
/// FilePath: /flutterDemo/lib/原理/keys/sample4.dart
/// Description: 
///
class Sample4 extends StatefulWidget {
  @override
  _Sample4State createState() => _Sample4State();
}

class _Sample4State extends State<Sample4> {
  int count = 0;
  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var child;
    if (count % 2 == 0) {
      child = Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          'text 2',
          textDirection: TextDirection.ltr,
          key: key,
        ),
      );
    } else {
      child = Container(
        child: Text(
          'text 2',
          textDirection: TextDirection.ltr,
          key: key,
        ),
      );
    }
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text(
            '$count',
            textDirection: TextDirection.ltr,
          ),
          onPressed: () {
            print(this.widget);
            setState(() {
              count += 1;
            });
          },
        ),
        child
      ],
    );
  }
}