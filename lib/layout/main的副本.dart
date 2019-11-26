import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 return new MaterialApp(
      title: 'Welcome to hah Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome wode hahh 1231 12Flutter'),
        ),
        body: new Center(
          child: new Text('Hello121112131212 World'),
        ),
      ),
    );
  }
//等价于

// @override
//   Widget build(BuildContext context) {
//     AppBar appbar = AppBar(title: Text('Welcome wode hahh 1231 12Flutter'));
//     Center center = Center(child: Text('Hello121112131212 World'));
//     Scaffold home = Scaffold(appBar: appbar, body: center);

//     MaterialApp app = MaterialApp(title: 'Welcome to flutter', home: home);
//     return app;
//   }

// }
}