import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title:  Text('Image学习'),),
        body: Center(
            child: ListView(
          children: <Widget>[
            Container(
              child: Image.network(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555747523962&di=a1c0b1b4f8561a79e5dcb4a7409b022c&imgtype=0&src=http%3A%2F%2Fp0.ssl.qhimg.com%2Ft01c3f5bf72e7d1ac67.png",
                scale: 1.0,
                fit: BoxFit.contain,
                color: Colors.greenAccent,
                colorBlendMode: BlendMode.darken,
                repeat: ImageRepeat.repeatY,
              ),
              // alignment: Alignment.center,

              width: MediaQuery.of(context).size.width,
              height: 400,
              color: Colors.red,
              // padding: const EdgeInsets.all(10.0),
            ),
             Container(
              child: Image.asset(
                'images/Apr-27-2019 16-03-03.gif',
                scale: 1.0,
              ),
              // padding: const EdgeInsets.all(10.0),
            ),
            
          ],
        )),
   
    );
  }
}