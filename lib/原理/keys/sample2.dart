import 'package:flutter/material.dart';

///
/// Author: 1254463047@qq.com
/// Date: 2020-03-28 23:21:13
/// LastEditTime: 2020-03-28 23:21:13
/// FilePath: /flutterDemo/lib/原理/keys/sample2.dart
/// Description: 
///
class Sample2 extends StatefulWidget {
  @override
  _Sample2State createState() => _Sample2State();
}

class _Sample2State extends State<Sample2> {
  int count = 0;
  Text cacheText;

  @override
  void initState() {
    cacheText = Text(
      'cache_text',
      textDirection: TextDirection.ltr,
    );
  }

  @override
  Widget build(BuildContext context) {
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
        cacheText,
        Text('no_cache_text', textDirection: TextDirection.ltr),
      ],
    );
  }
}