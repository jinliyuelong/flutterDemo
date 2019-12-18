import 'package:flutter/material.dart';

class ThreeTressDemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('三棵树demo'),),
      body: Container(
        color: Colors.blue,
        constraints: BoxConstraints(
           maxWidth: double.infinity,
            minWidth: 100.0,
            maxHeight: double.infinity,
            minHeight: 100.0
        ),
        // child: Customce,
      ),
    );
  }
}




