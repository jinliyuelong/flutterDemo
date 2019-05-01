import 'package:flutter/material.dart';

class MyVerticallylistview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('listview'),
        ),
        body:  ListView(
        
          children: <Widget>[
            ListTile(
              title: Text('access_time'),
              leading: Icon(Icons.access_time),
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('account_balance'),
            ),
            new Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555747523962&di=a1c0b1b4f8561a79e5dcb4a7409b022c&imgtype=0&src=http%3A%2F%2Fp0.ssl.qhimg.com%2Ft01c3f5bf72e7d1ac67.png'
                ),
            new Image.network(
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4214474476,1941437198&fm=26&gp=0.jpg'
                ),
          
          ],
        ),
    );
  }

}
