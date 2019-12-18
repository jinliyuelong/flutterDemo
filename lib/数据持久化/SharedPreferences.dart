

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DataSharePreferncesPage extends StatefulWidget {
  @override
  _DataSharePreferncesPageState createState() => _DataSharePreferncesPageState();
}

class _DataSharePreferncesPageState extends State<DataSharePreferncesPage> {
 
  String _shareContent = '';
  var _shareKeyController = TextEditingController();
  var _shareValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sharePreferncesPageS'),
      ),
      body:  SingleChildScrollView(
        child: _sharedPart(),
      )
      
    );
  }

Widget _sharedPart() {
    return Card(
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child:
                  Text('Shared Preferences', style: TextStyle(fontSize: 20.0, color: Theme.of(context).primaryColor)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 12.0),
              // 用于设置 key 信息
              child: TextField(
                controller: _shareKeyController,
                decoration: InputDecoration(labelText: '输入 share 存储的 key', icon: Icon(Icons.lock_outline)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 12.0),
              // 用于写入文本信息
              child: TextField(
                controller: _shareValueController,
                decoration: InputDecoration(labelText: '输入 share 存储的 value', icon: Icon(Icons.text_fields)),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: _writeIntoShare,
                child: Text('写入 share'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text('share 存储内容：'), Expanded(child: Text(_shareContent, softWrap: true))],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: _readFromShare,
                child: Text('读取 share'),
              ),
            ),
          ],
        ));
  }



  void _writeIntoShare() async {
    var shareKey = _shareKeyController.value.text;
    var shareContent = _shareValueController.value.text;

    if (shareKey == null || shareKey.isEmpty) {
      Fluttertoast.showToast(msg: '请输入 key');
    } else if (shareContent == null || shareContent.isEmpty) {
      Fluttertoast.showToast(msg: '请输入保存的内容');
    } else {
      var sp = await SharedPreferences.getInstance();
      sp.setString(shareKey, shareContent);
    }
  }


void _readFromShare() async {
    var shareKey = _shareKeyController.value.text;

    if (shareKey == null || shareKey.isEmpty) {
      Fluttertoast.showToast(msg: '请输入 key');
    } else {
      var sp = await SharedPreferences.getInstance();
      var value = sp.getString(shareKey);

      if (value == null) {
        Fluttertoast.showToast(msg: '未找到该 key');
        setState(() => _shareContent = '');
      } else {
        setState(() => _shareContent = value);
      }
    }
  }


}
