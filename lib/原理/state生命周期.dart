import 'package:flutter/material.dart';

class StatePeriodWidget extends StatefulWidget  {
  @override
  _StatePeriodWidgetState createState() => _StatePeriodWidgetState();
}

class _StatePeriodWidgetState extends State<StatePeriodWidget> with WidgetsBindingObserver {
  
  /***
   * initState：插入渲染树时调用，只调用一次，
   * widget创建执行的第一个方法，可以再里面初始化一些数据，以及绑定控制器 
   */
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print('initState');
  }
  

@override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('didChangeAppLifecycleState===${state.toString()}');
  }

  /***
   * 当State对象的依赖发生变化时会被调用；例如：在之前build() 
   * 中包含了一个InheritedWidget，然后在之后的build() 中InheritedWidget发生了变化，
   * 那么此时InheritedWidget的子widget的didChangeDependencies()回调都会被调用。
   * InheritedWidget这个widget可以由父控件向子控件共享数据，案例可以参考 scoped_model开源库。
   */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
  
  /**
   * 组件状态改变时候调用，可能会调用多次
   */
  @override
  void didUpdateWidget(StatePeriodWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
     print('didUpdateWidget');
  }
  /**
   * 它主要是用于构建Widget子树的，
   * 调用次数：多次，初始化之后开始绘制界面，当setState触发的时候会再次被调用
   */
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(title: Text('state生命周期'),),
      body: Center(
        child: GestureDetector(
          child: Text('lifeCycle'),
          onTap: (){
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: ( BuildContext c ){
            //     return Text('aaaa');
            //   })
            // );
          },
        ),
      ),
    );
  }

/**
 * 此回调是专门为了开发调试而提供的
 * ，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
 */
  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print('reassemble');
  }
  /**
   * 当State对象从树中被移除时，会调用此回调。
   */
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('deactivate');
  }
  
  /**
   * :当State对象从树中被永久移除时调用；通常在此回调中释放资源。
   */
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print('dispose');
  }
}

