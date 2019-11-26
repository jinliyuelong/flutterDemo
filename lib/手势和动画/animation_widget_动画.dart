import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimationWidget extends StatefulWidget {
  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _scaleAnimation; // 用于控制图标大小
  Animation<Color> _colorAnimation; // 控制图标颜色
  Animation<Offset> _positionAnimation; // 控制图标位置

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    // 不需要监听
    // _animationController.addListener(() {
    //   setState(() {});
    // });

    _animationController.addStatusListener((status) {
      if (_animationController.status == AnimationStatus.completed)
        _animationController.reverse();
      else if (_animationController.status == AnimationStatus.dismissed)
        _animationController.forward();
    });
    // 通过 `chain` 结合 `CurveTween` 修改动画的运动方式，曲线类型可自行替换

    _scaleAnimation = Tween(begin: 28.0, end: 50.0)
        .chain(CurveTween(curve: Curves.decelerate))
        .animate(_animationController);

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
      body: RunningHeart(
        animations: [_colorAnimation, _scaleAnimation, _positionAnimation],
        animationController: _animationController,
      ),
    );
  }
}

class RunningHeart extends AnimatedWidget {
  final List<Animation> animations; // 传入动画列表
  final AnimationController animationController; // 控制动画

  RunningHeart({this.animations, this.animationController})
      : assert(animations.length == 3),
       assert(animations[0] is Animation<Color>),
        assert(animations[1] is Animation<double>),
        assert(animations[2] is Animation<Offset>),
        super(listenable:animationController);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
         Positioned(
          // 之前的 animation 都通过 animations 参数传入到 `AnimationWidget`
          child: Icon(Icons.favorite, color: animations[0].value, size: animations[1].value),
          left: animations[2].value.dx,
          top: animations[2].value.dy,
        )
      ],
    );
  }
}
