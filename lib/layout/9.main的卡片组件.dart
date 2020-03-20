///
/// Author: 1254463047@qq.com
/// Date: 2019-11-21 21:01:30
/// LastEditTime: 2020-03-08 15:37:52
/// FilePath: /flutterDemo/lib/layout/9.main的卡片组件.dart
/// Description: 
///
import 'package:flutter/material.dart';


class MyCardView extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
       var card = new SizedBox(
      // height: 230.0,
      child: new Card(
        child: new Column(
          children: [
            new ListTile(
              title: new Text('1625 Main Street',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              subtitle: new Text('My City, CA 99984'),
              leading: new Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            new Divider(color: Colors.red,thickness: 1.0,indent: 10.0,endIndent: 10.0,),
            new ListTile(
              title: new Text('(408) 555-1212',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              leading: new Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
             new Divider(),
            new ListTile(
              title: new Text('costa@example.com'),
              leading: new Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      )
      );


      return Scaffold(
          appBar:new AppBar(
            title:new Text('卡片布局'),
          ),
          body:card
      );
  }
}