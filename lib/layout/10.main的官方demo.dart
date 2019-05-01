import 'package:flutter/material.dart';


//屏幕部分
//1.第二行
class SecondLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue[300],
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text('Oeschinen Lake 重复的多写几句看看重复的多写几句看看重复的多写几句看看',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black))),
                Text('Kandersteg, Switzerland',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[500])),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
  }
}

//第三行
class ThirdLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MaterialButton buildButtonColumn1(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return MaterialButton(
        onPressed: () => {print('$label被点击')},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: color),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: new Text(label,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: color,
                  )),
            )
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              // color: Colors.blueGrey,
              child: buildButtonColumn1(Icons.call, 'CALL'),
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.yellow,
              child: buildButtonColumn1(Icons.near_me, 'ROUTE'),
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.pink,
              child: buildButtonColumn1(Icons.share, 'SHARE'),
            ),
          )
        ],
      ),
    );
  }
}

class FourLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        style: TextStyle(
            fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.grey),
      ),
    );
  }
}

class MyOfficialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('官网的demo'),
        ),
        body: ListView(
          children: <Widget>[
             Image.network(
                  'https://upload-images.jianshu.io/upload_images/5157505-d19846f019de6e3c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1000',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  scale: 1,
                ),
                SecondLine(),
                ThirdLine(),
                FourLine()
          ],
        ));
  }
}
