import 'package:flutter/material.dart';

//3.listView 传入参数
void main () => runApp(MyApp(
  items: new List<String>.generate(30, (i)=> "Item ${i*2}")
));


class MyApp extends StatelessWidget {
  List<String> items;
  MyApp({Key key, @required this.items}):super(key:key);

  @override
  Widget build(BuildContext context) {
    print('===itme==${items}');
    items.add("100");
    return MaterialApp(
      title: "ListView widget",
      home: Scaffold(
        appBar: AppBar(
          title: Text('list 测试') ,
        ),
        body: Container(
          height:300 ,
          color: Colors.red,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context,index) => ListTile(title:Text('${items[index]}')),
          )
        )
      ),
    );
  }

}
