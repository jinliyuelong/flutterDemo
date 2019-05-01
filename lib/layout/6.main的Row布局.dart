import 'package:flutter/material.dart';


class MyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Row横向布局'),
        ),
        body: Row(
          children: <Widget>[
            Expanded(
                child: RaisedButton(
                    onPressed: () {
                      print('点击');
                    },
                    color: Colors.redAccent,
                    child: Text('红色按钮'))),
            Expanded(
                child: RaisedButton(
                    onPressed: () {
                      print('点击');
                    },
                    color: Colors.yellow,
                    child: Text('黄色按钮'))),
            Expanded(
                child: RaisedButton(
                    onPressed: () {
                      print('点击');
                    },
                    color: Colors.blueAccent,
                    child: Text('蓝色按钮'))),
            Expanded(
                child: RaisedButton(
                    onPressed: () {
                      print('点击');
                    },
                    color: Colors.greenAccent,
                    child: new Text('绿色按钮')))
          ],
        ));
  }
}

//第一列按照大小 剩下的平均
class MyRow1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Row横向布局'),
        ),
        body: Row(
          children: <Widget>[
            RaisedButton(
                onPressed: () {
                  print('点击');
                },
                color: Colors.redAccent,
                child: Text('红色按钮hahhahh')),
            Expanded(
                child: RaisedButton(
                    onPressed: () {
                      print('点击');
                    },
                    color: Colors.yellow,
                    child: Text('黄色按钮'))),
            Expanded(
                child: RaisedButton(
                    onPressed: () {
                      print('点击');
                    },
                    color: Colors.blueAccent,
                    child: Text('蓝色按钮')))
          ],
        ));
  }
}
