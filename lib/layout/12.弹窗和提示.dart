import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class PromptPageDemo extends StatefulWidget {
  @override
  _PromptPageDemoState createState() => _PromptPageDemoState();
}

class _PromptPageDemoState extends State<PromptPageDemo> {
  var count = 0;
  var _genders = ['男','女'];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // 自增操作
  increase() {
    setState(() => count++);
  }

  // 自减操作
  decrease() {
    setState(() => count--);
  }

  /// 显示SnackBar
  _changeValue(BuildContext context) {
    increase();

    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('当前值已修改'),
        action: SnackBarAction(label: '撤销', onPressed: decrease),
        duration: Duration(milliseconds: 2000)));
  }

  /// BottomSheet
  _showBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => ListView(
              // 生成一个列表选择器
              children: List.generate(
            20,
            (index) => InkWell(
                child: Container(
                    alignment: Alignment.center,
                    height: 60.0,
                    child: Text('Item ${index + 1}')),
                onTap: () {
                  print('tapped item ${index + 1}');
                  Navigator.pop(context);
                }),
          )),
    );
  }

  _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
            height: 180,
            child: ListView(
                children: List.generate(
              4,
              (index) => InkWell(
                  child: Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      child: Text('Item ${index + 1}')),
                  onTap: () {
                    print('tapped item ${index + 1}');
                    Navigator.pop(context);
                  }),
            ))));
  }

  _showAlertDialog() {
  
    showDialog(
        // 设置点击 dialog 外部不取消 dialog，默认能够取消
        barrierDismissible: true,
        context: context,
        
        builder: (context) => AlertDialog(
              title: Text('我是个标题...嗯，标题..'),
              titleTextStyle: TextStyle(color: Colors.purple), // 标题文字样式
              content: Text(r'我是内容\(^o^)/~, 我是内容\(^o^)/~, 我是内容\(^o^)/~'),
              contentTextStyle: TextStyle(color: Colors.green), // 内容文字样式
              backgroundColor: CupertinoColors.white,
              elevation: 8.0, // 投影的阴影高度
              semanticLabel: 'Label', // 这个用于无障碍下弹出 dialog 的提示
              shape: Border.all(),
              // dialog 的操作按钮，actions 的个数尽量控制不要过多，否则会溢出 `Overflow`
              actions: <Widget>[
                // 点击增加显示的值
                FlatButton(onPressed: increase, child: Text('点我增加')),
                // 点击减少显示的值
                FlatButton(onPressed: decrease, child: Text('点我减少')),
                // 点击关闭 dialog，需要通过 Navigator 进行操作
                FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('你点我试试.')),
              ],
            ));
  }

 _showSimpleDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
         // 通过 StatefulBuilder 来保存 dialog 状态
        // builder 需要传入一个 BuildContext 和 StateSetter 类型参数
        // StateSetter 有一个 VoidCallback，修改状态的方法在这写
        builder: (context) => 
        SimpleDialog(
              title: Text('我是个比较正经的标题...\n选择你的性别'),
              // 这里传入一个选择器列表即可
              children: _genders
                  .map((gender) => InkWell(
                        child: Container(height: 40.0, child: Text(gender), alignment: Alignment.center),
                        onTap: () {
                          Navigator.pop(context);
                          // Fluttertoast.showToast(msg: '你选择的性别是 $gender');
                        },
                      ))
                  .toList(),
            ));
  }

_showAboutDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AboutDialog(
              // App 的名字
              applicationName: 'Flutter 入门指北',
              // App 的版本号
              applicationVersion: '0.1.1',
              // App 基本信息下面会显示一行小字，主要用来显示版权信息
              applicationLegalese: 'Copyright: this is a copyright notice topically',
              // App 的图标
              applicationIcon: Icon(Icons.android, size: 28.0, color: CupertinoColors.activeBlue),
              // 任何你想展示的
              children: <Widget>[Text('我是个比较正经的对话框内容...你可以随便把我替换成任何部件，只要你喜欢(*^▽^*)')],
            ));
  }

_showStateDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => StatefulBuilder(
          builder:(context,dialogStateState) => SimpleDialog(
              title: Text('我这边能实时修改状态值'),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              children: <Widget>[
                Text('当前的值是： $count', style: TextStyle(fontSize: 18.0)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
                    RaisedButton(
                       // 通过 StatefulBuilder 的 StateSetter 来修改值
                      onPressed: () => dialogStateState( () => increase() ),
                      child: Text('点我自增'),
                    ),
                    RaisedButton(
                     onPressed: () => dialogStateState( () => decrease() ),
                      child: Text('点我自减'),
                    ),
                    RaisedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('点我关闭'),
                    )
                  ]),
                )
              ],
            ),
        )
        
            );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prompt Demo'),
      ),
      body: Column(children: <Widget>[
        Text('当前值：$count', style: TextStyle(fontSize: 20.0)),
        Expanded(
            // 为了方便拓展，我这边提取了 `snackBar` 的方法，并把按钮放在列表
            child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                children: <Widget>[
              RaisedButton(
                  onPressed: () => _changeValue(context),
                  child: Text('修改当前值1')),
              // SnackBar 需要提供一个包含 context，但是 context 不能是 Scaffold 节点下的 context，所以需要通过 Builder 包裹一层
              Builder(
                  builder: (context) => RaisedButton(
                      onPressed: () => _changeValue(context),
                      child: Text('修改当前值'))),
              Builder(
                  builder: (buildcontext) => RaisedButton(
                      onPressed: () => _showBottomSheet(buildcontext),
                      child: Text('BottomSheet'))),
              Builder(
                  builder: (buildcontext) => RaisedButton(
                      onPressed: () => _showModalBottomSheet(buildcontext),
                      child: Text('ModalBottomSheet'))),
              RaisedButton(
                  onPressed: () => _showAlertDialog(),
                  child: Text('showAlertDialog')),
               RaisedButton(
                  onPressed: () => _showSimpleDialog(),
                  child: Text('showSimpleDialog')),
                RaisedButton(
                  onPressed: () => _showAboutDialog(),
                  child: Text('showAboutDialog')),
                RaisedButton(
                  onPressed: () => _showStateDialog(),
                  child: Text('showStateDialog')),
            ]))
      ]),

      // 当 SnackBar 弹出时，fab 会上移一段距离
      floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
              onPressed: () => _changeValue(context), child: Icon(Icons.send))),
    );
  }
}
