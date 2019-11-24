import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helloworld/bloc/bloc_provider.dart';
import 'dart:io';
import '特效/特效home.dart';
import 'layout/basicsLayout.dart';
import 'navigation/navigationPractice.dart';
import 'utils/utility.dart';
import 'navigation/1.main的nav2传递参数1.dart';
import 'package:helloworld/Slide/滑动组件.dart';
import 'package:helloworld/bloc/page/bloc_home.dart';
import 'package:helloworld/bloc/count_bloc.dart';
import 'package:helloworld/bloc/count_provider.dart';
import 'package:provide/provide.dart';
void main() {

  final providers = Providers()
  // 将我们创建的数据管理类，通过 Provider.function 方法转换成 Provider，
  // 然后添加到 Providers 中
    ..provide(Provider.function((_) => CountProvider()));
  // 在 App 上层，通过包裹一层 ProvideNode，并将我们生成的 Providers 实例
  // 注册到 ProvideNode 中去，这样整个 App 都可以通过 Provide.value 查找相关的 Provider
  // 找到 Provider 后就可以找到我们的数据管理类

//  runApp(ProviderNode(
//    child: MaterialApp(
//      debugShowCheckedModeBanner: false,
//      // title: 'flutter学习demo',
//      // theme: ThemeData.light(),
//      onGenerateRoute: (setting) {
//        if (setting.name == '/page_person') {
//          return MaterialPageRoute(
//              builder: (context) => PersonDetail(person: setting.arguments));
//        }
//      },
//      home: MyHomeScreen(),
//    ),
//    providers: providers,
//  )
//  );
  runApp(BlocProvider(
    bloc: CountBlock(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'flutter学习demo',
      // theme: ThemeData.light(),
      onGenerateRoute: (setting) {
        if (setting.name == '/page_person') {
          return MaterialPageRoute(
              builder: (context) => PersonDetail(person: setting.arguments));
        }
      },
      home: MyHomeScreen(),
    ),
  ));
  // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset('images/app_bar_hor.jpg', fit: BoxFit.cover),
        ),
        title: Text('flutter学习demo'),
      ),
      body: ListView(
        children: <Widget>[
          getLines('基础的layout学习', context: context, ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyBasicLayoutScreen(),
                ));
          }),
          getLines('滑动组件的layout学习', context: context, ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MySlideWidget(),
                ));
          }),
          getLines('导航的学习', context: context, ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyNavigationPractice(),
                ));
          }),
          getLines('特效的学习', context: context, ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SpecialEfficiencyViewList(),
                ));
          }),
          getLines('状态管理', context: context, ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocHomePage(),
                ));
          }),
        ],
      ),
    );
  }
}
