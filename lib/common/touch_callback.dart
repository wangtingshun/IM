import 'package:flutter/material.dart';

//触摸回调组件
class TouchCallBack extends StatefulWidget{

  //子组件
  final Widget child;
  //回调函数
  final VoidCallback onPressed;
  final bool isfeed;
  //背景色
  final Color background;

  TouchCallBack({Key key,
    @required this.child,
    @required this.onPressed,
    this.isfeed: true,
    this.background: const Color(0xffd8d8d8)}) :super(key: key);

  @override
  TouchState createState() => new TouchState();
}

class TouchState extends State<TouchCallBack> {

  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        //使用Container容器包裹
      child: Container(
        color: color,
        child: widget.child,
      ),
      onTap: widget.onPressed,
      onTapDown: (d) {
        if (widget.isfeed == false) return;
        setState(() {
          color = widget.background;
        });
      },
      onPanCancel: () {
        setState(() {
          color = Colors.transparent;
        });
      },
    );
  }

}