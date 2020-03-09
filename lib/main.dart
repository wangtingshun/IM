import 'package:flutter/material.dart';
import './app.dart';
import './loading.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import './search.dart';
import 'chat/message_chat.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '聊天室',
      //自定义主题
      theme: mDefaultTheme,
      routes: <String, WidgetBuilder>{
        "app": (BuildContext context) => new App(),
        "/message": (BuildContext context) => new MessageChat(),
        "/friends": (_) => new WebviewScaffold(
              url: "https://flutter.io/",
              appBar: new AppBar(
                title: new Text("Flutter官网"),
              ),
              withZoom: true,
              withLocalStorage: true,
            ),
        'search': (BuildContext context) => new Search(), //搜索页面路由
      },
      home: new LoadingPage(), //指定首页，默认为加载页
    ));

final ThemeData mDefaultTheme = new ThemeData(
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Colors.blue,
);
