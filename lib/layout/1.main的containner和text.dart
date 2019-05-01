import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('Container学习'),),
        body: Center(
          child: Container(
            child: Text(
            "hello lyj 今天的天气不错，我要出去玩呀呀。但是我要学习，我爱学习。学习使我快乐，今天开始学习flutters",
            textAlign: TextAlign.center,
            // maxLines: 1,
            // overflow: TextOverflow.ellipsis,
            style:TextStyle(
              color: Color.fromRGBO(28, 29, 120, 1),
              fontSize: 14,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid//实线
              ) ,
            ),
            alignment: Alignment.center,
            width: 500,
            height: 100,
            // color: Colors.red,
            // padding: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),//内编剧
            margin: const EdgeInsets.all(10.0),//外边距
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.lightBlue,Colors.greenAccent,Colors.purple]
              ),
              border: Border.all(color: Colors.red,width: 2),
              borderRadius: BorderRadius.circular(50)
            ),
            
          )
          
          
        ),
      
    );
  }

}