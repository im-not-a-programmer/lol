import 'package:flutter/material.dart';

class ForWard extends StatefulWidget {
  @override
  _ForWardState createState() => _ForWardState();
}

class _ForWardState extends State<ForWard> {
  int tabStatus = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
      title: new Text('转发'),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(113, 12, 113, 1),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => print('点击了发送'),
          color: Color.fromRGBO(113, 12, 113, 1),
          textColor: Colors.white,
          child: Text('发送')
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: width/3,
              width: width - 16,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: TextField(
                  autofocus: true,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: ' 快来发表你的看法吧(已有300)',
                      hintStyle:
                          TextStyle(color: Colors.grey, fontSize: width / 24)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              color: Color.fromRGBO(247, 247, 247, 1),
              child: Row(
                children: <Widget>[
                  Image.asset('assets/home/home_photo1.png', width: width / 4, height: width / 4),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                            '斩月精灵啊实打实的',
                            style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                        ),
                        Text('这位老哥666！', style: TextStyle(color: Color.fromRGBO(102, 102, 102, 1)))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
 
}
