///
/// Author: 1254463047@qq.com
/// Date: 2019-11-24 20:58:58
/// LastEditTime: 2020-03-08 19:27:21
/// FilePath: /flutterDemo/lib/Slide/sliver_appbar_main.dart
/// Description: 
///
import 'package:flutter/material.dart';

class SliverBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> letters = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z'
    ];
    final List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.pink, Colors.yellow, Colors.deepPurple];

    return Scaffold(body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Sliver Demo'),

            centerTitle: true,
            // 展开的高度
            expandedHeight: 300.0,
            // 强制显示阴影
            forceElevated: true,
            // 设置该属性，当有下滑手势的时候，就会显示 AppBar
       floating: true,
//            // 该属性只有在 floating 为 true 的情况下使用，不然会报错
//            // 当上滑到一定的比例，会自动把 AppBar 收缩（不知道是不是 bug，当 AppBar 下面的部件没有被 AppBar 覆盖的时候，不会自动收缩）
//            // 当下滑到一定比例，会自动把 AppBar 展开
       snap: true,
            // 设置该属性使 Appbar 折叠后不消失
        // pinned: true,
            // 通过这个属性设置 AppBar 的背景
            flexibleSpace: FlexibleSpaceBar(
//          title: Text('Expanded Title'),
              // 背景折叠动画
              collapseMode: CollapseMode.pin,
              background: Image.asset('images/timg.jpg', fit: BoxFit.cover),
            ),

          ),
          
          // 这个部件一般用于最后填充用的，会占有一个屏幕的高度，
          // 可以在 child 属性加入需要展示的部件
//          SliverFixedExtentList(
//            delegate: SliverChildBuilderDelegate(
//                (context,index) => InkWell(
//                  child: Container(
//                    child: Text(letters[index] * 10,
//                        style: TextStyle(color: colors[index % colors.length], letterSpacing: 2.0),
//                        textScaleFactor: 1.5),
//                    alignment: Alignment.center,
//                  ),
//                  onTap: () {},
//                ),
//              childCount: letters.length
//            ),
//            itemExtent: 60.0,
//
//          ),
//          SliverFillRemaining(
//            child: Center(child: Text('FillRemaining', style: TextStyle(fontSize: 30.0))),
//          ),
        //如果一个滑动列表，每个 item 需要占满一个屏幕或者更大，可以使用该部件生成列表，但是如果 item 的高度小于一个屏幕高度，那就不太推荐了，在首尾会用空白 item 来把未填满的补上，就是首尾都会留空白。我们使用 SliverFillViewport 对 SliverFillRemaning 进行替换

          SliverFillViewport(
              viewportFraction: 1.0,
              delegate: SliverChildBuilderDelegate(
                      (_, index) => Container(child: Text('Item $index'), alignment: Alignment.center, color: colors[index % 4]),
                  childCount: 10))
        ],
      ),
    );
  }
}
