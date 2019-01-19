import 'package:flutter/material.dart';
import '../widgets/switch_appbar.dart';
import '../widgets/notice_card.dart';
import '../widgets/message_tile.dart';

class TextScreen extends StatefulWidget {
  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  bool status = true;
  List<Widget> noticeList = [
    MessageTile('assets/message/message_@me.png', '@我的'),
    MessageTile('assets/message/message_pinglun.png', '评论'),
  ];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 5; i++) {
      noticeList.add(NoticeCard());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _buildSearchBar(),
          Expanded(child: _buildBody(context))
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return AppBar(
      title: Text('正文'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => debugPrint('返回'),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return status
        ? _buildMessageList(context)
        : ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: 3,
            itemBuilder: (context, index) {
              return NoticeCard();
            });
  }

  Widget _buildMessageList(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8),
      children: noticeList,
    );
  }
}
