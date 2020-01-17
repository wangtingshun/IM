import 'package:flutter/material.dart';
import 'package:flutter_im/common/touch_callback.dart';
import 'message_data.dart';
import 'package:date_format/date_format.dart';
//聊天消息
class MessageItem extends StatelessWidget{

   final MessageData message;
   MessageItem(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5,color: Color(0xFFd9d9d9)))
      ),
      height: 64,
      child: TouchCallBack(
        onPressed: (){},
        //整体水平方向布局
        child: Row(
            //垂直方向剧中显示
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                 margin: const EdgeInsets.only(left: 13.0,right: 13.0),
                 child: Image.network(message.avatar,width: 48,height: 48,),
              ),
              Expanded(child: Column(
                //垂直方向剧中对齐
                mainAxisAlignment: MainAxisAlignment.center,
                //水平方向靠左对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(message.title,
                    style: TextStyle(fontSize: 16.0, color: Color(0xFF353535)),
                    maxLines: 1,),
                  Padding(padding: EdgeInsets.only(top: 8.0)),
                  Text(message.subTitle,
                    style: TextStyle(fontSize: 14.0, color: Color(0xFFa9a9a9)),
                  maxLines: 1,
                  //显示不完的用省略号省略
                  overflow: TextOverflow.ellipsis,)
                ],
              ),
              ),
              Container(
                //时间顶部对齐
                alignment: AlignmentDirectional.topStart,
                margin: const EdgeInsets.only(right: 12.0,top: 12.0),
                child: Text(formatDate(message.time,[HH,":",nn,":","ss"]).toString(),
                style: TextStyle(fontSize: 14.0,color: Color(0xFFa9a9a9)),),
              )
            ],
        ),
      ),
    );
  }
}