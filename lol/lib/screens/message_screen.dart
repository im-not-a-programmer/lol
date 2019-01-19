import 'package:flutter/material.dart';
import '../widgets/switch_appbar.dart';
import '../widgets/notice_card.dart';
import '../widgets/message_tile.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
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
    return SwitchAppBar(
      '通知',
      '消息',
      IconButton(
        icon: Icon(
          Icons.add_circle_outline,
          color: Colors.white,
          size: 28,
        ),
        onPressed: _onAddButtonPressed,
      ),
      _onNoticeTabTapped,
      _onMessageTabTapped,
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

  _onNoticeTabTapped() {
    status = true;
    setState(() {});
    print('find button pressed');
  }

  _onMessageTabTapped() {
    status = false;
    setState(() {});
    print('topic button pressed');
  }

  _onAddButtonPressed() {
    print('add button pressed');
  }
}
