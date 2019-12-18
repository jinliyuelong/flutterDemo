import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class HttpClientPage extends StatefulWidget {
  @override
  _HttpClientPageState createState() => _HttpClientPageState();
}

class _HttpClientPageState extends State<HttpClientPage> {
  static const _BIRD_SO_URL = 'http://www.caup.cn/';
  String _netBack = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('httpClient'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(onPressed: _httpClient, child: Text('Request')),
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
  _httpClient() async {
    HttpClient client;
    try {
      // step 1
      client = HttpClient();
      // step 2
//      Uri uri = Uri(scheme: 'https', host: 'www.xxx.com', queryParameters: {'a': 'AAA'});
      HttpClientRequest request = await client.getUrl(Uri.parse(_BIRD_SO_URL));
//      request.add(utf8.encode('{"a": "aaa"}'));
      request.headers.add('token', 'Bear ${'x' * 20}');
      request.headers.add('user-agent',
          'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');

      // step 3
      HttpClientResponse response = await request.close();
      print('http headers: ${response.headers.toString()}');
      // step 4
      String strResponse = await response.transform(utf8.decoder).join();
//      print('json: ${json.decode(strResponse)}');
      setState(() => _netBack = strResponse);
    } catch (e) {
      print('${e.toString()}');
      setState(() => _netBack = 'Fail');
    } finally {
      // step 5
      client.close();
    }
  }
}
