import 'package:flutter/material.dart';
import 'layout/basicsLayout.dart';
import 'navigation/navigationPractice.dart';
import 'utils/utility.dart';
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter学习demo',
      theme: ThemeData.light(),
      home: MyHomeScreen(),
    ));


class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('flutter学习demo'),
        ),
        body: ListView(
          children: <Widget>[
            getLines('基础的layout学习', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyBasicLayoutScreen(),
                  ));
            }),
             getLines('导航的学习', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyNavigationPractice(),
                  ));
            }),

            
          ],
        ),
    );
  }
}
