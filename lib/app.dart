import 'package:flutter/material.dart';
import 'chat/message_page.dart';
import 'contacts/contacts.dart';
import 'personal/personal.dart';

class App extends StatefulWidget{

  @override
  AppState createState() =>AppState();

}

class AppState extends State<App>{

  var _currentIndex = 0;
  //聊天页面
  Messagepage message;
  //好友页面
  Contacts contacts;
  //我的页面
  Personal me;


  currentPage(){
    switch(_currentIndex){
      case 0:
        if (message == null){
          message = new Messagepage();
        }
        return message;
      case 1:
        if (contacts == null){
          contacts = new Contacts();
        }
        return contacts;
      case 2:
        if (me == null){
          me = new Personal();
        }
        return me;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('偶尔'),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(
              Icons.search
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 30, right: 20.0),
            child: GestureDetector(
              onTap: () {
                showMenu(context: context, position: RelativeRect.fromLTRB(500.0, 82.0, 0.0, 0.0),
                    items: <PopupMenuEntry>[
                      _popupMenuItem('发起会话', imagePath: 'images/icon_menu_group.png'),
                      _popupMenuItem('添加好友',imagePath: 'images/icon_menu_addfriend.png'),
                      _popupMenuItem('联系客服',imagePath: 'images/icon_contact_servce.png')
                    ]);
              },
              //菜单按钮
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        //通过fixedColor设置选中item的颜色
          type: BottomNavigationBarType.fixed,
          //当前页面索引
          currentIndex: _currentIndex,
          //按下后设置当前页面索引
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            new BottomNavigationBarItem(
              title: new Text('聊天', style: TextStyle(
                  color: _currentIndex == 0 ? Color(0xFF1296db) : Color(
                      0xff999999)
              ),),
              icon: _currentIndex == 0 ? Image.asset(
                'images/message_pressed.png', width: 32, height: 28)
                  : Image.asset(
                'images/message_normal.png', width: 32, height: 28)
          ),
            new BottomNavigationBarItem(
                title: new Text('好友', style: TextStyle(
                    color: _currentIndex == 1 ? Color(0xFF1296db) : Color(
                        0xff999999)
                ),),
                icon: _currentIndex == 1 ? Image.asset(
                  'images/contacts_list_pressed.png', width: 32, height: 28,)
                    : Image.asset(
                  'images/contacts_list_normal.png', width: 32, height: 28,)),
            new BottomNavigationBarItem(
                title: new Text('我的', style: TextStyle(
                    color: _currentIndex == 2 ? Color(0xFF1296db) : Color(
                        0xff999999)),),
                icon: _currentIndex == 2 ? Image.asset('images/profile_pressed.png', width: 32, height: 28,)
                    : Image.asset('images/profile_normal.png', width: 32, height: 28,))
          ]
      ),
      body: currentPage(),
    );
  }

  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
      //判断是使用图片路径还是图标
      child: Row (
        children: <Widget>[
          imagePath != null
              ? Image.asset(imagePath, width: 32, height: 32,)
              : SizedBox(width: 32, height: 32, child: Icon(icon
            , color: Colors.white,)),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

}