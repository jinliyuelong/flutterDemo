import 'dart:async';
import 'package:flutter/material.dart';
import 'package:helloworld/bloc/bloc_provider.dart';
import 'package:helloworld/bloc/count_bloc.dart';


class StreamHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取注册的 bloc，必须先注册，再去查找
    final CountBlock _bloc = BlocProvider.of<CountBlock>(context);
    return Scaffold(
      appBar: AppBar(title: Text('bloc状态管理'),),
      body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: StreamBuilder(
              initialData: _bloc.count,
              stream: _bloc.countStream,
              builder: (_, snapshot) => Text('${snapshot.data}', style: TextStyle(fontSize: 20.0)),
            ),
          )),
      floatingActionButton:
      // 通过 bloc 中的 dispatch 方法进行值的修改，通知 stream 刷新界面
      FloatingActionButton(onPressed: () =>
          _bloc.dispatch(_bloc.count + 1), child: Icon(Icons.add)),
    );
  }
}
//3/
//class StreamHome extends StatefulWidget {
//  @override
//  _StreamHomeState createState() => _StreamHomeState();
//}
//
//class _StreamHomeState extends State<StreamHome> {
//  // 定义一个全局的 `StreamController`
//  StreamController<int> _controller = StreamController.broadcast();
//  // `sink` 用于传入新的数据
//  Sink<int> _sink;
//  int _counter = 0;
//
//  @override
//  void initState() {
//    super.initState();
//    _sink = _controller.sink;
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    // 需要销毁资源
//    _sink.close();
//    _controller.close();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//        title: Text('状态管理'),
//      ),
//      body: SafeArea(
//          child: Container(
//            alignment: Alignment.center,
//            child: StreamBuilder(
//              builder: (_, snapshot) => Text('${snapshot.data}', style: TextStyle(fontSize: 24.0)),
//              stream: _controller.stream, // stream 在 StreamBuilder 销毁的时候会自动销毁
//              initialData: _counter,
//            ),
//          )),
//      // 通过 `sink` 传入新的数据，去通知 `stream` 更新到 builder 中
//      floatingActionButton: FloatingActionButton(
//        onPressed: () => _sink.add(_counter++),
//        child: Icon(Icons.add),
//      ),
//    );
//  }
//}

///2.

//
//class _StreamHomeState extends State<StreamHome> {
//
//
//  StreamController _controller = StreamController.broadcast();  // 创建单订阅类型 `StreamController`
//  Sink _sink;
//  StreamSubscription _subscription;
//  StreamSubscription _subscription1;
//  @override
//  void initState() {
//    super.initState();
//
//    _sink = _controller.sink;
//
//    _sink.add('A');
//    _subscription = _controller.stream.listen((data) => print('Listener: $data'),onDone: null,onError: null);
//
//
//    //Stream 中还提供了很多 StremTransformer，用于对监听到的数据进行处理，比如我们发送 0~19 的 20 个数据，只接受大于 10 的前 5 个数据，那么可以对 stream 如下操作
//    //
////    _subscription1 = _controller.stream
////        .where((value) => value > 10)
////        .take(5)
////        .listen((data) => print('Listen: $data'));
//    _sink.add(11);
//    _subscription.pause();
//    _sink.add(11.16);
//    _subscription.resume();
//
//    _sink.add([1, 2, 3]);
//    _sink.add({'a': 1, 'b': 2});
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    // 最后要释放资源...
//    _sink.close();
//    _controller.close();
//    _subscription.cancel();
//    _subscription1.cancel();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text('状态管理'),
//
//        ),
//        body: Container()
//    );
//  }
//}

////1.
//class _StreamHomeState extends State<StreamHome> {
//
//
//  StreamController _controller = StreamController();  // 创建单订阅类型 `StreamController`
//  Sink _sink;
//  StreamSubscription _subscription;
//
//  @override
//  void initState() {
//    super.initState();
//
//    _sink = _controller.sink; // _sink 用于添加数据
//    // _controller.stream 会返回一个单订阅 stream，
//    // 通过 listen 返回 StreamSubscription，用于操作流的监听操作
//    _subscription = _controller.stream.listen((data) => print('Listener: $data'));
//
//    // 添加数据，stream 会通过 `listen` 方法打印
////    _sink.add('A');
////    _sink.add(11);
////    _sink.add(11.16);
////    _sink.add([1, 2, 3]);
////    _sink.add({'a': 1, 'b': 2});
//
//    //结果一样 也就是说，调用 pause 方法后，stream 被堵住了，数据不继续发送了。
//    _sink.add('A');
//    _subscription.pause(); // 暂停监听
//    _sink.add(11);
//    _sink.add(11.16);
//    _subscription.resume(); // 恢复监听
//    _sink.add([1, 2, 3]);
//    _sink.add({'a': 1, 'b': 2});
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    // 最后要释放资源...
//    _sink.close();
//    _controller.close();
//    _subscription.cancel();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('状态管理'),
//
//      ),
//      body: Container()
//    );
//  }
//}
