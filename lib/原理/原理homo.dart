import 'package:flutter/material.dart';
import 'package:helloworld/utils/utility.dart';
import 'state生命周期.dart';

class FundamentalsHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('原理的学习'),),
      body: ListView(
          children: <Widget>[
            getLines('state生命周期', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StatePeriodWidget(),
                  ));
            })
          ],
        ) ,
    );
  }
}