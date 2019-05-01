import 'package:flutter/material.dart';


class MyTextPractice extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    print('text学习页面');
    return Scaffold(
       appBar: AppBar(title: Text('text学习'),),
        body: Center(
            child: Text(
            "hello lyj 今天的天气不错，我要出去玩呀呀。但是我要学习，我爱学习。学习使我快乐，今天开始学习flutters",
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            style:TextStyle(
              color: Color.fromRGBO(28, 29, 120, 1),
              fontSize: 14,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid//实线
              ) ,
            ),
        ),
    );
  }

}