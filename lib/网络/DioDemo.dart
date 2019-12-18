import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioDemoPage extends StatefulWidget {
  @override
  _DioDemoPageeState createState() => _DioDemoPageeState();
}

class _DioDemoPageeState extends State<DioDemoPage> {
  static const _USER_ME_URL = 'https://randomuser.me/api/';
  String _netBack = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DioHttp'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(onPressed: _dioRequest, child: Text('Request')),
            ),
            Text(_netBack)
          ],
        ),
      ),
    );
  }

  ///
  /// description: 点击
  ///
  _dioRequest() async {
    BaseOptions options = BaseOptions(connectTimeout: 5000, receiveTimeout: 60000);
    Dio dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(onRequest: (opt) {
      // 获取查询的参数
      Map params = opt.queryParameters;
      // 将所有的参数转为小写，因为查询参数通过 map 形式上传
      params.forEach((key, value) => opt.queryParameters[key] = '$value'.toLowerCase());
      // 这边还可以做些别的操作，例如需要 token 进行用户身份验证，则通过头部进行添加
      // opt.headers['authorization'] = 'token';
      // 在官网中，提供了 lock 和 unlock 的写法，被 lock 后，接下来的请求会进入队列等待，
      // 直到 unlock 后才能继续，可以用于几个请求，后续的需要用到前面的返回值的情况使用

      // 返回修改后的 RequestOptions
      return opt;
    }, onResponse: (resp) {
      // 返回响应体后，将 info 字段的内容切除，并将 json 拼接完成
      // resp.data = '${'${resp.data}'.split(', info').first}}';
      return resp;
    }, onError: (error) {
      // 发生错误时的回调
      return error;
    }));

    // 发送一个请求，可以查看下打印的结果
    Response response = await dio.get(_USER_ME_URL, queryParameters: {'a': 'AAA', 'b': 'BbBbBb'});
    print(response.data);
    print(response.request.headers);
    print(response.request.queryParameters);
    setState(() => _netBack = response.data.toString()); // 界面显示 response.data
  }
}
