import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('联系人'),),
      body: Center(
        child: Text('我是联系人'),
      ),
    );
  }
}