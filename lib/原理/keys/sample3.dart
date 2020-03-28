import 'package:flutter/material.dart';

///
/// Author: 1254463047@qq.com
/// Date: 2020-03-28 23:21:25
/// LastEditTime: 2020-03-28 23:21:26
/// FilePath: /flutterDemo/lib/原理/keys/sample3.dart
/// Description: 
///
class Sample3 extends StatefulWidget {
  @override
  _Sample3State createState() => _Sample3State();
}

class _Sample3State extends State<Sample3> {
   int count = 0;

  GlobalKey keyOne = GlobalKey();
  GlobalKey keyTwo = GlobalKey();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
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
      Text(
        'key${count%2}',
        textDirection: TextDirection.ltr,
        key: count % 2 == 0 ? keyOne : keyTwo,
      ),
    ];
    if (count % 2 == 0) {
      list.add(RaisedButton(
          onPressed: () {},
          child: Text('button text', textDirection: TextDirection.ltr)));
    } else {
      list.add(Text('just text', textDirection: TextDirection.ltr));
    }
    return Column(
      children: list,
    );
  }
}