import 'package:flutter/material.dart';
import 'pages/message_screen.dart';
import 'pages/home_screen.dart';
import 'pages/contact_screen.dart';
import 'pages/me_screen.dart';
class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _tabIndex = 0;
  List<Image> _tabImages = [
    Image.asset('images/center-outline.png',width: 22,height: 22),
    Image.asset('images/message-outline@3x.png',width: 22,height: 22),
    Image.asset('images/contact-outline@3x.png',width: 22,height: 22),
    Image.asset('images/mine-outline@3x.png',width: 22,height: 22),
  ];

  List<Image> _tabSelectedImages = [
    Image.asset('images/center.png',width: 22,height: 22,),
    Image.asset('images/message@3x.png',width: 22,height: 22),
    Image.asset('images/contact@3x.png',width: 22,height: 22),
    Image.asset('images/mine@3x.png',width: 22,height: 22),
  ];

  Image getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }
List<Widget> screenlist = List();
@override
void initState() { 
  screenlist
  ..add(HomeScreen())
  ..add(MessageScreen())
  ..add(ContactScreen())
  ..add(MeScreen());
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenlist[_tabIndex],

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(title: Text('首页'), icon: getTabIcon(0)),
          BottomNavigationBarItem(title: Text('信息'), icon: getTabIcon(1)),
          BottomNavigationBarItem(title: Text('联系人'), icon: getTabIcon(2)),
          BottomNavigationBarItem(title: Text('我的'), icon: getTabIcon(3)),
        ],
        currentIndex: _tabIndex,
        onTap: (index){
          setState(() {
            _tabIndex = index;
          });
        } ,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
