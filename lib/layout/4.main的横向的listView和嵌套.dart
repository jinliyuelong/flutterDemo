import 'package:flutter/material.dart';

/* mylist */
class Mylist extends  StatelessWidget{
  
  @override
  Widget build(BuildContext context) {

    return ListView(
            scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 100,
              color: Colors.lightBlue,
            ),
            Container(
              width: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              color: Colors.yellow,
            ), Container(
              width: 100,
              color: Colors.lightBlue,
            ),
            Container(
              width: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              color: Colors.yellow,
            )
          ],
        );
  }
}

class MyHorizontallyListview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('listview'),
        ),
        body: Container(
          height:300 ,
          child: Mylist()
        )
    );
  }

}
