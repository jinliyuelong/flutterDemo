///
/// Author: 1254463047@qq.com
/// Date: 2020-04-14 14:43:16
/// LastEditTime: 2020-04-14 14:49:41
/// FilePath: /flutterDemo/lib/三方库/linked_scroll_controller_demo.dart
/// Description: 
///
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
class LinkedScrollables extends StatefulWidget {
  @override
  _LinkedScrollablesState createState() => _LinkedScrollablesState();
}

class _LinkedScrollablesState extends State<LinkedScrollables> {
  LinkedScrollControllerGroup _controllers;
  ScrollController _letters;
  ScrollController _numbers;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _letters = _controllers.addAndGet();
    _numbers = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _letters.dispose();
    _numbers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text('三方库'),
      ),
      body:Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
          Expanded(
            child: ListView(
              controller: _letters,
              children: <Widget>[
                _Tile('Hello A'),
                _Tile('Hello B'),
                _Tile('Hello C'),
                _Tile('Hello D'),
                _Tile('Hello E'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              controller: _numbers,
              children: <Widget>[
                _Tile('Hello 1'),
                _Tile('Hello 2'),
                _Tile('Hello 3'),
                _Tile('Hello 4'),
                _Tile('Hello 5'),
                 _Tile('Hello 6'),
              ],
            ),
          ),
        ],
      ),
    )
    );
  }
}

class _Tile extends StatelessWidget {
  final String caption;

  _Tile(this.caption);

  @override
  Widget build(_) => Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        height: 150.0,
        child: Center(child: Text(caption)),
      );
}