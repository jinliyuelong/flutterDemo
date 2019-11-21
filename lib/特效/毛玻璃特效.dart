import 'package:flutter/material.dart';
import 'dart:ui';   //引入ui库，因为ImageFilter Widget在这个里边。

class FrostedGlassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('毛玻璃特效'),),
      body:Stack(   //重叠的Stack Widget，实现重贴
        children: <Widget>[
          ConstrainedBox( //约束盒子组件，添加额外的限制条件到 child上。
            constraints: const BoxConstraints.expand(), //限制条件，可扩展的。
            child:Image.network(  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555747523962&di=a1c0b1b4f8561a79e5dcb4a7409b022c&imgtype=0&src=http%3A%2F%2Fp0.ssl.qhimg.com%2Ft01c3f5bf72e7d1ac67.png")
          ),
          Center(
            child: ClipRect(  //裁切长方形
              child: BackdropFilter(   //背景滤镜器
                filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0), //图片模糊过滤，横向竖向都设置5.0
                child: Opacity( //透明控件
                  opacity: 0.5,
                  child: Container(// 容器组件
                    width: 500.0,
                    height: 700.0,
                    decoration: BoxDecoration(color:Colors.grey.shade200), //盒子装饰器，进行装饰，设置颜色为灰色
                    child: Center(
                      child: Text(
                        'Liyanjun',
                        style: Theme.of(context).textTheme.display3, //设置比较酷炫的字体
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}