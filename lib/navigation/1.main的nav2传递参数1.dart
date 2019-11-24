import 'package:flutter/material.dart';

class MynavigationPrams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('携带参数的导航'),
      ),
      body: PersonList(
        list: List.generate(20, (i) => Person('哈哈哈$i', i)),
      ),
    );
  }
}

class Person {
  final String name;
  final int age;
  Person(this.name, this.age);
}

class PersonList extends StatelessWidget {
  final List<Person> list;
  PersonList({Key key, @required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    list.forEach((Person p) {
      print("name==${p.name}");
    });
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('数据：${list[index].name}'),
            onTap: () {
              print('${list[index].name}点击');
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => PersonDetail(person: list[index])
//                  )
//
//              );
            Navigator.pushNamed(context, '/page_person',arguments: list[index]);
            },
          );
        },
   
    );
  }
}

//详情页
class PersonDetail extends StatelessWidget {
  final Person person;
  PersonDetail({Key key, @required this.person}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('name is ${person.name}'),
            Text('age is ${person.age}')
          ],
        ),
      ),
    );
  }
}
