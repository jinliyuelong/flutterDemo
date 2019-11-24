import 'package:flutter/material.dart';

class SliverHeaderDemoPage extends StatelessWidget {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverPersistentHeader(
        // 属性同 SliverAppBar
        pinned: true,
        floating: true,
        // 因为 SliverPersistentHeaderDelegate 是一个抽象类，所以需要自定义
        delegate: CustomSliverPersistentHeaderDelegate(
          max: 300.0,
          min: 100.0,
          child: Container(
              color: Colors.pink,
              alignment: Alignment.center,
              child: Text('我是一个头部部件',
                  style: TextStyle(color: Colors.white, fontSize: 30.0))),
        ),
      ),

      // 这个部件一般用于最后填充用的，会占有一个屏幕的高度，
      // 可以在 child 属性加入需要展示的部件
      SliverFillRemaining(
        child: Center(
            child: Text('FillRemaining', style: TextStyle(fontSize: 30.0))),
      ),
    ]));
  }
}

class DemoHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Colors.pink,
        alignment: Alignment.center,
        child: Text('我是一个头部部件',
            style: TextStyle(color: Colors.white, fontSize: 30.0)));
  } // 头部展示内容

  @override
  double get maxExtent => 300.0; // 最大高度

  @override
  double get minExtent => 100.0; // 最小高度

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>
      false; // 因为所有的内容都是固定的，所以不需要更新
}

// 自定义 SliverPersistentHeaderDelegate
class CustomSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double max; // 最大高度
  final double min; // 最小高度
  final Widget child; // 需要展示的内容

  CustomSliverPersistentHeaderDelegate(
      {@required this.max, @required this.min, @required this.child})
      // 如果 assert 内部条件不成立，会报错
      : assert(max != null),
        assert(min != null),
        assert(child != null),
        assert(min <= max),
        super();

  // 返回展示的内容，如果内容固定可以直接在这定义，如果需要可扩展，这边通过传入值来定义
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      child;

  @override
  double get maxExtent => max; // 返回最大高度

  @override
  double get minExtent => min; // 返回最小高度

  @override
  bool shouldRebuild(CustomSliverPersistentHeaderDelegate oldDelegate) {
    // 是否需要更新，这里我们定义当高度范围和展示内容被替换的时候进行刷新界面
    return max != oldDelegate.max ||
        min != oldDelegate.min ||
        child != oldDelegate.child;
  }
}
