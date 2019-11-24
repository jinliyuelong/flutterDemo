import 'package:flutter/material.dart';

class MySingleSrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> letters  = List.generate(50, (index) => '很长陈航的数据$index');
    return Scaffold(
        appBar: AppBar(title: Text('Single Child Demo'),),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Center(
            child: Row(
              children: List.generate(
                  letters.length,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 6.0),
                    child: Text(letters[index], style: TextStyle(fontSize: 18.0)),
                  )),
            ),
          ),
        )
    );
  }
//
//  Widget build(BuildContext context) {
//    List<String> letters  = List.generate(50, (index) => '很长陈航的数据$index');
//    return Scaffold(
//      appBar: AppBar(title: Text('Single Child Demo'),),
//      body: SingleChildScrollView(
//        child: Center(
//          child: Column(
//            children: List.generate(
//                letters.length,
//                    (index) => Padding(
//                  padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 6.0),
//                  child: Text(letters[index], style: TextStyle(fontSize: 18.0)),
//                )),
//          ),
//          ),
//        )
//    );
//  }
}
