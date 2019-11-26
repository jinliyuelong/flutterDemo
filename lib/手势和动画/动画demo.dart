import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimationDemoPage extends StatefulWidget {
  @override
  _AnimationDemoPageState createState() => _AnimationDemoPageState();
}


class _AnimationDemoPageState extends State<AnimationDemoPage> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _scaleAnimation; // 用于控制图标大小
  Animation<Color> _colorAnimation; // 控制图标颜色
  Animation<Offset> _positionAnimation; // 控制图标位置

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));

    // 当动画值发生变化的时候，重绘下 icon
    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.addStatusListener((status) {
      if (_animationController.status == AnimationStatus.completed)
        _animationController.reverse();
      else if (_animationController.status == AnimationStatus.dismissed) _animationController.forward();
    });
    // 通过 `chain` 结合 `CurveTween` 修改动画的运动方式，曲线类型可自行替换
   
    _scaleAnimation =
        Tween(begin: 28.0, end: 50.0).chain(CurveTween(curve: Curves.decelerate)).animate(_animationController);

    _colorAnimation = ColorTween(begin: Colors.red[200], end: Colors.red[900])
        .chain(CurveTween(curve: Curves.decelerate))
        .animate(_animationController);

    _positionAnimation = Tween(begin: Offset(100, 100), end: Offset(300, 300))
        .chain(CurveTween(curve: Curves.bounceInOut))
        .animate(_animationController);

    _animationController.forward(); // 启动动画
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demo'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Icon(Icons.favorite, color: _colorAnimation.value, size: _scaleAnimation.value),
            left: _positionAnimation.value.dx,
            top: _positionAnimation.value.dy,
          )
        ],
      ),
    );
  }
}
// class _AnimationDemoPageState extends State<AnimationDemoPage>  with TickerProviderStateMixin {
//   AnimationController _animationController;
//   Animation _animation;

//   @override
//   void initState() {
//     super.initState();
    
//     _animationController = AnimationController(
//         vsync: this, duration: Duration(milliseconds: 1000), 
//         // lowerBound: 28.0, upperBound: 50.0
//         );

//     // 当动画值发生变化的时候，重绘下 icon
//     _animationController.addListener(() {
//       setState(() {});
//     });

//     _animationController.addStatusListener((status) {
//       if (_animationController.status == AnimationStatus.completed)
//         _animationController.reverse();  // 正向结束后开始反向
//       else if (_animationController.status == AnimationStatus.dismissed) 
//         _animationController.forward(); // 反向结束后开始正向
//     });
//      _animation  = Tween(begin: 12.0,end: 50.0).animate(_animationController);

//     _animationController.forward(); // 启动动画

    
//   }

//   @override
//   void dispose() {
//     // 一定要释放资源
//     _animationController.dispose();
//     super.dispose();
//   }

//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Animation Demo'),
//       ),
//       body: Center(
//         child: IconButton(
//             icon: Icon(Icons.android, color: Colors.green[500], size: _animation.value),
//             onPressed: () {
//               // 根据状态执行不同动画运动方式
//               if (_animationController.status == AnimationStatus.completed)
//                 _animationController.reverse();
//               else if (_animationController.status == AnimationStatus.dismissed)
//                 _animationController.forward();
//             }),
//       ),
//     );
//   }
// }
// }
// class _AnimationDemoPageState extends State<AnimationDemoPage>  with TickerProviderStateMixin {
//   AnimationController _animationController;

//   @override
//   void initState() {
//     super.initState();
    
//     _animationController = AnimationController(
//         vsync: this, duration: Duration(milliseconds: 1000), lowerBound: 28.0, upperBound: 50.0);

//     // 当动画值发生变化的时候，重绘下 icon
//     _animationController.addListener(() {
//       setState(() {});
//     });

//     _animationController.addStatusListener((status) {
//       if (_animationController.status == AnimationStatus.completed)
//         _animationController.reverse();  // 正向结束后开始反向
//       else if (_animationController.status == AnimationStatus.dismissed) 
//         _animationController.forward(); // 反向结束后开始正向
//     });

//     _animationController.forward(); // 启动动画

//   }

//   @override
//   void dispose() {
//     // 一定要释放资源
//     _animationController.dispose();
//     super.dispose();
//   }

//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Animation Demo'),
//       ),
//       body: Center(
//         child: IconButton(
//             icon: Icon(Icons.android, color: Colors.green[500], size: _animationController.value),
//             onPressed: () {
//               // 根据状态执行不同动画运动方式
//               if (_animationController.status == AnimationStatus.completed)
//                 _animationController.reverse();
//               else if (_animationController.status == AnimationStatus.dismissed)
//                 _animationController.forward();
//             }),
//       ),
//     );
//   }
// }