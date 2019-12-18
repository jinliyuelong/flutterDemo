import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  List<String> letters = List.generate(20, (index) => 'list数据$index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('listView'),
        ),
        body: SingleChildScrollView(
            child: ExpansionTile(
                // 最前面的 widget
                leading: Icon(Icons.phone_android),
                // 替换默认箭头
//        trailing: Icon(Icons.phone_iphone),
                title: Text('Parent'),
                // 默认是否展开
                initiallyExpanded: true,
                // 展开时候的背景色
                backgroundColor: Colors.yellow[100],
                // 展开或者收缩的回调，true 表示展开
                onExpansionChanged: (expanded) => print(
                    'ExpansionTile is ${expanded ? 'expanded' : 'collapsed'}'),
                children: List.generate(
                    letters.length,
                    (index) => Container(
                          padding: const EdgeInsets.only(left: 80.0),
                          child: Text(letters[index]),
                          height: 50.0,
                          alignment: Alignment.centerLeft,
                        )))));
  }
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('listView'),
//      ),
//      body: ListView.separated(
//          itemBuilder: (_, index) => Padding(
//                padding: const EdgeInsets.symmetric(vertical: 20.0),
//                child: Center(
//                    child: Text(letters[index],
//                        style: TextStyle(color: Colors.blue))),
//              ),
//          separatorBuilder: (context, index) =>
//               Divider(
//                height: 1,
//                color: index % 2 == 0 ? Colors.black : Colors.red
//              ),
//
//          itemCount: letters.length),
//    );
//  }
}
