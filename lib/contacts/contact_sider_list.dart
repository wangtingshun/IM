import 'package:flutter/material.dart';
import 'contact_vo.dart';

class ContactSiderList extends StatefulWidget {
  //好友列表项数据
  final List<ContactVO> items;

  //好友列表头
  final IndexedWidgetBuilder headerBuilder;

  //
  final IndexedWidgetBuilder itemBuilder;

  //字母构造器
  final IndexedWidgetBuilder sectionBuilder;

  ContactSiderList(
      {Key key,
      @required this.items,
      this.headerBuilder,
      @required this.itemBuilder,
      @required this.sectionBuilder})
      : super(key: key);

  @override
  ContactState createState() => new ContactState();
}

class ContactState extends State<ContactSiderList> {
  final ScrollController _scrollController = new ScrollController();

  bool _onNotification(ScrollNotification notification) {
    return true;
  }

  //判断并显示头部视图或空容器
  _isShowHeaderView(index) {
    if (index == 0 && widget.headerBuilder != null) {
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context, index),
      );
    }
    return Container();
  }

  bool _shouldShowHeader(int position) {
    if (position <= 0) {
      return false;
    }
    if (position != 0 &&
        widget.items[position].seationKey !=
            widget.items[position - 1].seationKey) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          NotificationListener(
              onNotification: _onNotification,
              child: ListView.builder(
                  controller: _scrollController,
                  //列表里面的内容不足一屏时，列表也可以滑动
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: widget.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: <Widget>[
                          //显示列表头
                          _isShowHeaderView(index),
                          Offstage(
                            offstage: _shouldShowHeader(index),
                            child: widget.sectionBuilder(context, index),
                          ),
                          //显示列表项
                          Column(
                            children: <Widget>[
                              widget.itemBuilder(context, index),
                            ],
                          )
                        ],
                      ),
                    );
                  })
          )
        ],
      ),
    );
  }
}
