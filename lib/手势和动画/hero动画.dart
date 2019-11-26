import 'package:flutter/material.dart';

class HeroAnimationPage extends StatefulWidget {
  @override
  _HeroAnimationPageState createState() => _HeroAnimationPageState();
}

class _HeroAnimationPageState extends State<HeroAnimationPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    // 一定要释放资源
    
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demo'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: InkWell(
          child: Hero(
            tag: 'hero_tag',
            child: Image.asset('images/ali.jpg', width: 100.0, height: 100.0),
          ),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HeroPage())),
        ),
      ),
    );
  }
}

class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: InkWell(
          child: Hero(tag: 'hero_tag', child: Image.asset('images/ali.jpg', width: 200.0, height: 200.0)),
          onTap: () => Navigator.pop(context),
        ),
      ),
    );
  }
}