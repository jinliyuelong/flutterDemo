///
/// Author: liyanjun43@jd.com
/// Date: 2019-12-17 14:28:07
/// LastEditTime: 2019-12-17 15:38:20
/// FilePath: /flutterDemo/lib/网络/bloc和网络结合.dart
/// Description:
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/网络/user_bloc.dart';
import 'package:helloworld/网络/random_user.dart';
import 'package:helloworld/bloc/bloc_provider.dart';

class UserPageDemo extends StatelessWidget {
  // 将首字母大写
  String _upperFirst(String content) {
    assert(content != null && content.isNotEmpty);
    return '${content.substring(0, 1).toUpperCase()}${content.substring(1)}';
  }

  // 地址信息通用部件
  Widget _userLocation(String info) => Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(info, style: TextStyle(color: Colors.white, fontSize: 16.0)));

  @override
  Widget build(BuildContext context) {
    UserBloc _bloc = BlocProvider.of<UserBloc>(context);
    _bloc.updateUserInfo();

    return Scaffold(
      appBar: AppBar(
        title: Text('bloc和网络结合'),
      ),
      // StreamBuilder 接受更新数据的 stream
      body: StreamBuilder(
          builder: (_, AsyncSnapshot<RandomUserModel> snapshot) => Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blue[600], Colors.blue[400]])),
                child: !snapshot.hasData
                    ? CupertinoActivityIndicator(radius: 12.0)
                    : Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                        InkWell(
                            // 用于切换数据
                            child: ClipOval(
                              // 圆形头像
                              child: FadeInImage.assetNetwork(
                                  placeholder: 'images/ava_default.png',
                                  image: snapshot.data.results[0].picture.large),
                            ),
                            onTap: () => _bloc.updateUserInfo()), // 更新数据
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                              '${_upperFirst(snapshot.data.results[0].name.first)} ${_upperFirst(snapshot.data.results[0].name.last)}',
                              style: TextStyle(color: Colors.white, fontSize: 24.0)),
                        ),
                        Text('${snapshot.data.results[0].email}',
                            style: TextStyle(color: Colors.white, fontSize: 18.0)),
                        _userLocation('${snapshot.data.results[0].location.street}'),
                        _userLocation('${_upperFirst(snapshot.data.results[0].location.city)}'),
                        _userLocation('${_upperFirst(snapshot.data.results[0].location.state)}'),
                      ]),
              ),
          // initialData: _bloc.user, // 注入初始值
          stream: _bloc.stream), // 注入更新 stream
    );
  }
}
