
import 'package:flutter/material.dart';
import 'package:helloworld/bloc/count_provider.dart';
import 'package:provide/provide.dart';

class StreamHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
              alignment: Alignment.center,
              // 通过指定类型，获取特定的 Provide，这个 Provide 会返回我们的数据管理类 provider
              // 通过内部定义的方法，获取到需要展示的值
              child: Provide<CountProvider>(builder: (_, widget, provider) => Text('${provider.value}')),
            )),
        floatingActionButton: FloatingActionButton(
            onPressed: () =>
            // 通过 value 方法获取到我们的数据管理类 provider，
            // 通过调用改变值的方法，修改内部的值，并通知界面刷新重建
            Provide.value<CountProvider>(context).changeValue(
                Provide.value<CountProvider>(context).value + 1),
            child: Icon(Icons.add))
    );
  }
}