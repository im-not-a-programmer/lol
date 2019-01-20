import 'package:flutter/material.dart';
import 'switch_appbar.dart';

class SearchAppBar extends StatefulWidget {
  final String text1;
  final String text2;
  final Function text1Pressed;
  final Function text2Pressed;
  final Function search;

  SearchAppBar(this.text1, this.text2, this.text1Pressed, this.text2Pressed,
      this.search);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool _isSearch = false;
  TextEditingController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchIcon = 'assets/find/find_search2.png';
    final size = MediaQuery.of(context).size;

    return _isSearch
        ? _buildSearchBar(size)
        : SwitchAppBar(
            '${widget.text1}',
            '${widget.text2}',
            IconButton(
              padding: EdgeInsets.all(16),
              icon: Image.asset(searchIcon),
              onPressed: _onSearch,
            ),
            widget.text1Pressed,
            widget.text2Pressed,
          );
  }

  Widget _buildSearchBar(Size size) {
    return AppBar(
      titleSpacing: 8,
      title: Column(
        children: <Widget>[
          SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 22,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4)
              ),
              child: TextField(
                autofocus: true,
                focusNode: _focusNode,
                controller: _controller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: '请输入你想要搜索的内容'),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
      actions: <Widget>[
        InkWell(
          onTap: _onCanceButtonPressed,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
                child: Text(
              '取消',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
          ),
        ),
      ],
    );
  }

  _onSearch() {
    widget.search();
    _isSearch = true;
    setState(() {});
  }

  _onCanceButtonPressed() {
    _focusNode.unfocus();
    _isSearch = false;
    setState(() {});
  }
}
