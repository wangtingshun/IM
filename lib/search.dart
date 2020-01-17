import 'package:flutter/material.dart';
import 'common/touch_callback.dart';

//搜索页
class Search extends StatefulWidget{

  @override
  SearchState createState() => new SearchState();
}

class SearchState extends State<Search>{

  FocusNode focusNode = new FocusNode();

   //请求获取焦点
  _requestFocus(){
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }

  //返回一个文本组件
  _getText(String text) {
    return TouchCallBack(isfeed: false, onPressed: () {},
      child: Text(
        text,
        //添加文本样式
        style: TextStyle(fontSize: 14, color: Color(0xFF1296db)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 25),
        //整体垂直布局
        child: Column(
          //水平方向剧中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //顶部导航栏包括返回按钮、搜索框
            Stack(
              children: <Widget>[
                TouchCallBack(
                    isfeed: false,
                    child: Container(
                      height: 45.0,
                      margin: const EdgeInsets.only(left: 12, right: 10.0),
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 45.0,
                  margin: const EdgeInsets.only(left: 50.0, right: 10.0),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.blue)
                    ),
                  ),
                  child: Row(
                    //水平方向居中
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //请求获取焦点
                      Expanded(child: TextField(
                        focusNode: _requestFocus(),
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                        onChanged: (String text) {},
                        decoration: InputDecoration(
                            hintText: '搜索',
                            border: InputBorder.none
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.mic,
                          color: Color(0xffaaaaaa),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Text(
                '常用搜索',
                style: TextStyle(fontSize: 16.0,color: Color(0xffb5b5b5),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(30.0),
            child: Row(
              //对齐方式采用均匀对齐
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              //第一行搜索项
              children: <Widget>[
                _getText('朋友'),
                _getText('聊天'),
                _getText('群组')
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 30.0,right: 30.0),
            child: Row(
              //对齐方式采用均匀对齐
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //第二行搜索项
                _getText('Android'),
                _getText('Flutter'),
                _getText('ios')
              ],
            ),)
          ],
        ),
      ),
    );
  }

}