///
/// Author: liyanjun43@jd.com
/// Date: 2019-11-24 23:02:59
/// LastEditTime: 2019-12-29 19:11:30
/// FilePath: /flutterDemo/lib/bloc/count_bloc.dart
/// Description: 
///
import 'dart:async' ;

import 'package:helloworld/bloc/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:scoped_model/scoped_model.dart';

class CountBlock extends BaseBloc{
  int _count = 0;
  int get count => _count;

  // rx
  BehaviorSubject<int> _countController = BehaviorSubject();

  Observable<int> get countStream => Observable(_countController.stream);

  void dispatch(int value) {
    
    _count = value;
    _countController.add(_count);
  
  }

//  // stream
//  // ignore: close_sinks
//  StreamController<int> _countController = StreamController.broadcast();
//
//  Stream<int> get countStream => _countController.stream; // 用于 StreamBuilder 的 stream
//
//  void dispatch(int value){
//    _count = value;
//    _countController.sink.add(_count); // 用于通知修改值
//  }
  @override
  void dispose() {
    // TODO: implement dispose
    _countController.close(); // 注销资源
  }
}