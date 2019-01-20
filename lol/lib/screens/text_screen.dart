import 'package:flutter/material.dart';
import '../widgets/profile_widget.dart';
import '../widgets/focus_button.dart';

class TextScreen extends StatefulWidget {
  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      title: new Text('正文'),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(113, 12, 113, 1),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: _buildHeader(size)
          )
        ],
      )
    );
  }

  Widget _buildHeader(size) {
    return Column(children: <Widget>[
      Container(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: Text(
            '是什么导致LOL败给DOTA?',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.width / 18),
          ),
        )
      ),
      _buildProfileRow(size)
    ]);
  }
  
  Widget _buildProfileRow(size) {
    return Container(
      decoration: new BoxDecoration(border: Border.all(style: BorderStyle.solid)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildProfileWidget(size),
          FocusButton(_onFocusButtonTapped)
        ],
      )
    );
  }

  _buildProfileWidget(size) {
    return Row(
      children: <Widget>[
        ProfileWidget('assets/home/home_head.png'),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 4, 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '浮生',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '2-13 8.00',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        )
      ],
    ); 
  }

  _onFocusButtonTapped() {
    print('focus button tapped');
  }
}
