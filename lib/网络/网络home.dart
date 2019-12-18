
import 'package:flutter/material.dart';
import 'package:helloworld/utils/utility.dart';
import 'package:helloworld/网络/HttpClient.dart';
import 'package:helloworld/网络/DioDemo.dart';
import 'package:helloworld/网络/bloc和网络结合.dart';
import 'package:helloworld/bloc/bloc_provider.dart';
import 'package:helloworld/网络/user_bloc.dart';
class NetHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('数据持久化'),),
      body: ListView(
          children: <Widget>[
            getLines('HttpClien', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HttpClientPage(),
                  ));
            }),
             getLines('DioDemoPage', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DioDemoPage(),
                  ));
            }),
            getLines('bloc和网络结合', context: context,ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(bloc: UserBloc(),child:UserPageDemo() ,),
                  ));
            }),
          ],
        ) ,
    );
  }
}