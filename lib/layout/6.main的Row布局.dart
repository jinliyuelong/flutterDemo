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

class MyWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Row横向布局'),
        ),
        body:  Wrap(
          children: <Widget>[
            Text('ABC' * 5, style: TextStyle(color: Colors.red, fontSize: 16.0)),
            Text('ABC' * 5, style: TextStyle(color: Colors.black, fontSize: 16.0)),
            Text('ABC' * 5, style: TextStyle(color: Colors.purple, fontSize: 16.0)),
            Text('ABC' * 5, style: TextStyle(color: Colors.pink, fontSize: 16.0)),
            Text('ABC' * 5, style: TextStyle(color: Colors.black, fontSize: 16.0))
          ],
        )
    )
        ;
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
