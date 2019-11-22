import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Column纵向布局'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center, //副轴
          mainAxisAlignment: MainAxisAlignment.start, //主轴
          children: <Widget>[
            Container(
                color: Colors.redAccent,
                height: 60,
                width: 300,
                child: Text('我是lyj，哈哈哈')),
            Container(
              color: Colors.blue,
              child: Text('这里是垂直布局'),
              width: MediaQuery.of(context).size.width,
            ),
            Container(
                color: Colors.yellowAccent,
                child: Text('今天天气有点小雨，要在家里学习'),
                width: MediaQuery.of(context).size.width)
          ],
        ));
  }
}

//平分
class MyColumn1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Column纵向布局'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //副轴
          mainAxisAlignment: MainAxisAlignment.start, //主轴
          children: <Widget>[
            Container(
                color: Colors.redAccent,
                height: 60,
                alignment: Alignment.center,
                child: Text('我是lyj，哈哈哈')),
            Expanded(
                child: Container(
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text('这里是垂直布局'))),
            Expanded(
                child: Container(
                    color: Colors.yellowAccent,
                    child: Center(child: Text('今天天气有点小雨，要在家里学习'))))
          ],
        ));
  }
}
