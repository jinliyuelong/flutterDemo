///
/// Author: 1254463047@qq.com
/// Date: 2020-04-14 14:51:52
/// LastEditTime: 2020-04-14 14:51:53
/// FilePath: /flutterDemo/lib/三方库/scrollable_positioned_list_demo.dart
/// Description: 
///
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:scrollable_positioned_list/src/item_positions_notifier.dart';


class AttestationRebindPage extends StatefulWidget {
  @override
  _AttestationRebindPageState createState() => _AttestationRebindPageState();
}

class _AttestationRebindPageState extends State<AttestationRebindPage>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsNotifier itemPositionsListener = ItemPositionsNotifier();

  TabController _tabController;
  final List<Widget> myTabs = <Widget>[
    new Tab(text: '个人信息'),
    new Tab(text: '证件信息'),
    new Tab(text: '资质信息'),
    new Tab(text: '人车合照'),
  ];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
    itemPositionsListener.itemPositions.addListener(() {
      ItemPosition itemPosition = itemPositionsListener.itemPositions.value?.first;
      _changeTab(itemPosition.index);
    });
  }

  _listViewScroll(int index) async {
    itemScrollController.scrollTo(index: index, duration: Duration(milliseconds: 250));
  }

  ///
  /// description: 滑动tab页面
  ///
  _changeTab(int section) {
    _tabController.animateTo(section);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
        title: Text('scrollable_positioned_list'),
      ),
          body: _creatContentFatherWidget(context)
               
    );
  }

  Widget _creatContentFatherWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color(0xfff6f6f6),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: TabBar(
              tabs: myTabs,
              indicatorWeight: 2.0,
              // labelPadding: EdgeInsets.only(left: 20.0.w, right: 0.0.w),
              // indicatorPadding: EdgeInsets.only(left: 20.0.w, right: 0.0.w),
              controller: _tabController,
              isScrollable: true,
              onTap: (index) {
                _listViewScroll(index);
              },
              unselectedLabelColor: Color(0xff888888) ,
              labelColor: Color(0xffff483d),
              labelStyle: new TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: new TextStyle(
                fontSize: 14,
//                    fontWeight: FontWeight.w600,
              ),
              indicatorColor:Color(0xffff483d),
              indicatorSize: TabBarIndicatorSize.label,
            ),
          ),
          Expanded(child: _createContentWidget(context))
        ],
      ),
    );
  }

  ///
  /// description: 创建内容
  ///
  Widget _createContentWidget(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemCount: 5,
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            //个人信息
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _Tile('个人信息'),
                 _Tile('个人信息内容'),
              ],
            );
            break;
          case 1:
            //证件信息
            return Column(
              children: <Widget>[
               _Tile('证件信息信息'),
                 _Tile('证件信息信息内容'),
              ],
            );
            break;
           case 2:
            //资质信息
            return Column(
              children: <Widget>[
               _Tile('资质信息信息'),
                 _Tile('资质信息信息内容'),
              ],
            );
            break;
            case 3:
            //人车合照
            return Column(
              children: <Widget>[
               _Tile('人车合照信息信息'),
                 _Tile('人车合照信息信息内容'),
              ],
            );
            break;
          case 4:
            return Container(height: MediaQuery.of(context).size.height * 0.5);
            break;
          default:
        }
      },
    );
  }


    }
class _Tile extends StatelessWidget {
  final String caption;

  _Tile(this.caption);

  @override
  Widget build(_) => Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        height: 150.0,
        child: Center(child: Text(caption)),
      );
}