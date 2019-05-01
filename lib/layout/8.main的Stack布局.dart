import 'package:flutter/material.dart';


class Mystack1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      // alignment: const FractionalOffset(0.5, 0.8),
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.redAccent,
          radius: 100,
        ),
        Positioned(
          bottom: 60,
          right: 20,
          child: Text('lyj哈哈哈12'),
        ),
        Positioned(
          top: 40,
          left: 30,
          child: Text('最上面'),
        )
      ],
    );
  }
}

class MyStackView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
var myStack = Stack(
      // alignment: const FractionalOffset(0.5, 0.8),
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.redAccent,
          radius: 100,
        ),
        Positioned(
          bottom: 60,
          right: 20,
          child: Text('lyj哈哈哈12'),
        ),
        Positioned(
          top: 40,
          left: 30,
          child: Text('最上面'),
        )
      ],
    );

    return  Scaffold(
          appBar: AppBar(
            title: Text('Column纵向布局'),
          ),
          body: Center(child: Mystack1()),
      //  body: Center(child: myStack)),
    );
  }
}
