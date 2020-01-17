
import 'package:flutter/material.dart';

//加载页
class LoadingPage extends StatefulWidget{

  @override
  _LoadingState createState() => new _LoadingState();

}

class _LoadingState extends State<LoadingPage> {

  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration(seconds: 0),(){
      Navigator.of(context).pushReplacementNamed("app");
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Stack(
        children: <Widget>[
          //加载页面居中背景
          Image.network("images/laoding.jpg",fit: BoxFit.cover,)
        ],
      ),
    );
  }

}