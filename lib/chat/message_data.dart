//聊天数据
class MessageData{
  //头像
  String avatar;
  //主标题
  String title;
  //子标题
  String subTitle;
  //消息时间
  DateTime time;
  //消息类型
  MessageType type;

  MessageData(this.avatar,this.title,this.subTitle,this.time,this.type);
}

enum MessageType{ SYSTEM,PUBLIC,CHAT,GROUP}

List<MessageData> messageData = [
  new MessageData(
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4055008011,2693519006&fm=26&gp=0.jpg',
      '白龙马', '我和师傅都被妖精抓走了，你们咋还不来救我们', new DateTime.now(), MessageType.CHAT),
  new MessageData(
      'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3429390499,2179580616&fm=15&gp=0.jpg',
      '悟空', '妖怪，吃老孙一棒', new DateTime.now(), MessageType.PUBLIC),
  new MessageData(
      'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=600054699,2222709344&fm=26&gp=0.jpg',
      '八戒', '大伙还是散了吧，我回高老庄找我的翠花', new DateTime.now(), MessageType.SYSTEM),
  new MessageData(
      'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2280073872,2399622067&fm=15&gp=0.jpg',
      '沙和尚', '我们还是等大叔兄回来再说吧', new DateTime.now(), MessageType.GROUP),
  new MessageData(
      'http://img.duoziwang.com/2017/05/20/B28906280.jpg', '唐僧', '悟空，你去找些斋饭来',
      new DateTime.now(), MessageType.CHAT),
  new MessageData(
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4010335972,1245914212&fm=15&gp=0.jpg',
      '妖精', '我想吃唐僧肉，长生不老，哈哈哈', new DateTime.now(), MessageType.GROUP)
];