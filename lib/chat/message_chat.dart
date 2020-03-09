import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';

class MessageChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '页面跳转返回数据示例',
      theme: new ThemeData(
        brightness: Brightness.light, //应用程序整体主题亮度
        primaryColor: Colors.lightGreen[600], //APP主要部分的背景色
        accentColor: Colors.orange[600], //前景色(文本、按钮)
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            '文本数据',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Text('上一页面传递的数据'),
        //    backgroundColor: Colors.grey,
      ),
    );
  }
}




