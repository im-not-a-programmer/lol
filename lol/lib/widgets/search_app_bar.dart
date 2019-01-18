import 'package:flutter/material.dart';
import 'switch_appbar.dart';

class SearchAppBar extends StatefulWidget {
  final String text1;
  final String text2;
  final Function text1Pressed;
  final Function text2Pressed;
  final Function search;

  SearchAppBar(this.text1, this.text2, this.text1Pressed,
      this.text2Pressed,this.search);

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

    return _isSearch?_buildSearchBar(): SwitchAppBar(
      '${widget.text1}',
      '${widget.text2}',
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: Image.asset(searchIcon),
          onPressed: _onSearch,
        ),
      ),
      widget.text1Pressed,
      widget.text2Pressed,
    );
  }

  Widget _buildSearchBar(){
    return AppBar(
      title: Column(
        children: <Widget>[
          SizedBox(height: 4,),
          SizedBox(
            height: 22,
            child: TextField(
              autofocus: true,
              focusNode: _focusNode,
              controller: _controller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search,color: Colors.grey,),
                  hintText: '请输入你想要搜索的内容'
              ),
            ),
          ),
          SizedBox(height: 8,),
        ],
      ),
      actions: <Widget>[FlatButton(
        padding: EdgeInsets.all(0),
        child: Text('取消',style: TextStyle(color: Colors.white,fontSize: 18),),
        onPressed: _onCanceButtonPressed,
      ),],
    );
  }



  _onSearch(){
    widget.search();
    _isSearch = true;
    setState(() {});
  }

  _onCanceButtonPressed(){
    _focusNode.unfocus();
    _isSearch = false;
    setState(() {});
  }
}
