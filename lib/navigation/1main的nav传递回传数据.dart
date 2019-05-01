import 'package:flutter/material.dart';



class MyRetunParamsFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页"),),
      body: Center(
        child: RouteButton(),
      ),
    );
  }
}


//跳转的Button
class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:(){
          _navigteToNextPage(context);
      },
      child: Text('去第二个页面'),
    );
  }
}
 _navigteToNextPage(BuildContext context) async{
   final reuslt = await Navigator.push(context, 
    MaterialPageRoute(builder:(context){
      return NextPage();
   } 
   )
   );
   Scaffold.of(context).showSnackBar(SnackBar(
     content: Text('$reuslt'),
     backgroundColor: Colors.greenAccent,
     duration: Duration(seconds: 1),
   ));
 }



class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('第二个页面'),),
      body: Center(
        child: Column(
          children: <Widget>[
            MaterialButton(
              child: Text('我是按钮1'),
              onPressed: (){
                Navigator.pop(context,'按钮1');
              },
            ) ,
            MaterialButton(
              child: Text('我是按钮2'),
              onPressed: (){
                Navigator.pop(context,'按钮2');
              },
            ) ,
          ],
        ) ,
      ),
    );
  }
}
