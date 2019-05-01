import 'package:flutter/material.dart';



class MysecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(title: Text('第二个页面')),
       body: Center(
         child: RaisedButton(
           child: Text('返回'),
           onPressed: (){
             Navigator.pop(context);
           },
         ),
       ),
    );
  }
}



class MyfristScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('首页'),),
      body: Center(
        child: RaisedButton(
          child: Text('进入子页面'),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
             builder: (context)=>MysecondScreen()
            ));
          },
        ),
      ),
    );
  }
}