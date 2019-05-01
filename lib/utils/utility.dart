import 'package:flutter/material.dart';

/// 生成一个以[text]为文本的行，[ontap]为点击这个行之后的回调
Container getLines(String text, {BuildContext context,void Function() ontap}) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(text),
            trailing: Icon(Icons.navigate_next),
            onTap:ontap,
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ), //分割线
        ],
      ),
    );
  }