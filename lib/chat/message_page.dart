import 'package:flutter/material.dart';
import 'message_data.dart';
import 'message_item.dart';

class MessagePage extends StatefulWidget{

  @override
  MessagePageState createState() => new MessagePageState();

}

class MessagePageState extends State<MessagePage>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: RefreshIndicator(child: ListView.builder(
          itemCount: messageData.length,
          itemBuilder: (BuildContext context,int index){
            return new MessageItem(messageData[index]);
          }), onRefresh: _handleRefresh),
    );
  }

  Future<Null> _handleRefresh() async{
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

}