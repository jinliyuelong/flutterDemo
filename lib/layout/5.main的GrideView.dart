import 'package:flutter/material.dart';

class MYGridView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('GridView'),
        ),
        body: GridView.count(
          padding: EdgeInsets.all(2), //外部容器的边距
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5.0,
          childAspectRatio: 2,
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Text(
                '我是lyj1',
                textAlign: TextAlign.center,
              ),
              alignment: Alignment.center,
            ),
            Container(
              color: Colors.red,
              child: Text('我是lyj'),
            ),
            Container(
              color: Colors.red,
              child: Text('我是lyj'),
            ),
            Container(
              color: Colors.yellow,
              child: Text('我是lyj'),
            ),
            Container(
              color: Colors.yellow,
              child: Text('我是lyj'),
            ),
            Container(
              color: Colors.yellow,
              child: Text('我是lyj'),
            ),
            Container(
              color: Colors.blue,
              child: Text('我在中国'),
            )
          ],
        ));
  }
}

class MyGridView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('GridView'),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5.0,
              childAspectRatio: 0.7),
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Text(
                '我是lyj1',
                textAlign: TextAlign.center,
              ),
              alignment: Alignment.center,
            ),
            Container(
              color: Colors.red,
              child: Text('我是lyj'),
            ),
            Container(
              color: Colors.red,
              child: Text('我是lyj'),
            ),
            Container(
              color: Colors.yellow,
              child: Text('我是lyj'),
            ),
            Container(
              color: Colors.yellow,
              child: Text('我是lyj'),
            ),
            Container(
              color: Colors.yellow,
              child: Text('我是lyj'),
            ),
            Container(
              color: Colors.blue,
              child: Text('我在中国'),
            )
          ],
        ));
  }
}
