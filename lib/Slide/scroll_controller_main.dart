import 'package:flutter/material.dart';

class ScrollControllerDemoPage extends StatefulWidget {
  @override
  _ScrollControllerDemoPageState createState() => _ScrollControllerDemoPageState();
}

class _ScrollControllerDemoPageState extends State<ScrollControllerDemoPage> {
  var _scrollController = ScrollController();
  var _showBackTop = false;

  @override
  void initState() {
    super.initState();

    // 对 scrollController 进行监听
    _scrollController.addListener(() {
      // _scrollController.position.pixels 获取当前滚动部件滚动的距离
      // window.physicalSize.height 获取屏幕高度
      // 当滚动距离大于 35 后，显示回到顶部按钮
//      print("_scrollController.position.pixels===${_scrollController.position.pixels}");
      setState(() => _showBackTop = _scrollController.position.pixels >= 35);
    });
  }

  @override
  void dispose() {
    // 记得销毁对象
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollController Demo'),
      ),
      body: ListView(
        controller: _scrollController,
        children: List.generate(
            20, (index) => Container(height: 50.0, alignment: Alignment.center, child: Text('Item ${index + 1}'))),
      ),
      floatingActionButton: _showBackTop? FloatingActionButton(
        onPressed: () {
          // scrollController 通过 animateTo 方法滚动到某个具体高度
          // duration 表示动画的时长，curve 表示动画的运行方式，flutter 在 Curves 提供了许多方式
          _scrollController.animateTo(0.0, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
        },
        child: Icon(Icons.vertical_align_top),
      ):null,

    );
  }
}
