///
/// Author: 1254463047@qq.com
/// Date: 2019-11-21 22:24:38
/// LastEditTime: 2020-03-08 15:13:31
/// FilePath: /flutterDemo/lib/layout/2.main中的button.dart
/// Description: 
///
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('button学习'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                print('This is a Rased Button can be clicked');
              },
              child: Text('Raised Enable'),
            ),
            RaisedButton(onPressed: null, child: Text('Raised Disable')),
            Container(
              height: MediaQuery.of(context).size.width/10/0.8,
              width: MediaQuery.of(context).size.width/10,
              child: MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),),
            color: Colors.yellow,
            padding: EdgeInsets.zero,
            highlightColor: Colors.blueAccent,
            splashColor: Colors.blueAccent,
            child: Text('哈', style: TextStyle(color: Color(0xff333333), fontSize: 18, fontWeight: FontWeight.bold),),
            onPressed:() {
            }
              )
            ),
            FlatButton(
              onPressed: () => print('This is a Flat Button can be clicker'),
              child: Text('Flat Enable'),
              
            ),
            FlatButton(onPressed: null, child: Text('Flat Disable')),
            IconButton(icon: Icon(Icons.android), onPressed: () {}),
            IconButton(icon: Icon(Icons.android), onPressed: null),
            MaterialButton( onPressed: () {}, child: Text('Material Enable')),
            MaterialButton(onPressed: null, child: Text('Material Disable')),
            OutlineButton( onPressed: () {}, child: Text('Outline Enable')),
            OutlineButton(onPressed: null, child: Text('Outline Enable')),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, icon: Icon(Icons.android), label: Text('Android')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
