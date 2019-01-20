import 'package:flutter/material.dart';
import '../widgets/profile_widget.dart';
import '../widgets/focus_button.dart';
import '../widgets/hint_widget.dart';
import '../widgets/comment_textfield_sheet.dart';

class TextScreen extends StatefulWidget {
  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  int tabStatus = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      body: Column(
        children: <Widget>[
          _buildSearchBar(),
          Expanded(child: _buildBody(context))
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(size)
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
    return ListView(
      padding: EdgeInsets.all(8),
      children: <Widget> [
        _buildHeader(size),
        _buildTextWidget(size),
        _tablePage(context, size),
        _tableContainer(context, size)
      ],
    );
  }

  Widget _buildHeader(size) {
    return Column(children: <Widget>[
      Container(
        color: Colors.white,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(20),
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
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
        child: Container(
          decoration: new BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(230, 230, 230, 1))), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildProfileWidget(size),
                FocusButton(_onFocusButtonTapped)
              ],
            )
          ),
        )
      )
    );
  }

  Widget _buildProfileWidget(size) {
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

  Widget _buildTextWidget(size) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          child: Column(
            children: <Widget>[
              Text('LOL和DOTA2撕了这么多年，至今未有定论。————好在本文大规模使用了数据分析武器，目的就是打造一个全新的场地，让大家撕个痛快'),
              Image.asset('assets/home/home_photo1.png', width: size.width,),
              Text('巴拉巴拉！')
            ]
          ),
        )
      )
    );
  }

  Widget _bottomNavigationBar(size) {
    final iconSize = size.width / 14;

    return BottomNavigationBar(
      onTap: (index) => _onNavBar(context, index),
      items: [
        BottomNavigationBarItem(
          icon: SizedBox(height: iconSize, child: HintWidget(false, Image.asset('assets/text/article_zhuanfa.png'))),
          title: Text('转发'),
        ),
        BottomNavigationBarItem(
          icon: SizedBox(height: iconSize, child: HintWidget(false, Image.asset('assets/text/article_pinglun.png'))),
          title: Text('评论'),
        )
      ]
    );
  }
  
  Widget _tablePage(context, size) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Container(
          decoration: new BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(230, 230, 230, 1))), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(children: <Widget>[
              GestureDetector(
                onTap: () => _onTabChange(0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    '转发',
                    style: tabStatus == 0 ? TextStyle(fontWeight: FontWeight.bold, fontSize: size.width / 20) : TextStyle(fontSize: size.width / 28)
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _onTabChange(1),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    '评论',
                    style: tabStatus == 1 ? TextStyle(fontWeight: FontWeight.bold, fontSize: size.width / 20) : TextStyle(fontSize: size.width / 28)
                  ),
                ),
              ),
            ]),
          )
        )
      ),
    );
  }

  Widget _tableContainer(context, size) {
    final iconSize = size.width / 14;
    final boxSiz = size.width / 3;
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: SizedBox(
                  height: 56, width: 56, child: ProfileWidget('assets/find/01.png')),
            ),
            Container(
              decoration: new BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(230, 230, 230, 1)))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Text(
                      '斩月精灵',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width/24,),
                    ),
                    SizedBox(width: 120,),
                    Text('19：00',style: TextStyle(color: Colors.grey),)
                  ]),
                  SizedBox(
                    width: size.width/2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Text(
                        '转发微博转发微博转发微博转发微博转发微博转发微博转发微博',
                        style: TextStyle(color: Colors.grey),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Row(children: <Widget>[
                      Text(
                        '带带大师兄: ',
                        style: TextStyle(color: Color.fromRGBO(101, 95, 255, 1))
                      ),
                      Text('老哥稳得一批')
                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '带带大师兄: ',
                          style: TextStyle(color: Color.fromRGBO(101, 95, 255, 1))
                        ),
                        Text(
                          '回复大师兄: ',
                          style: TextStyle(color: Color.fromRGBO(230, 230, 230, 1))
                        ),
                        Text('老哥稳得一批!!')
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: boxSiz,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: GestureDetector(
                            child: Row(
                              children: <Widget>[
                                SizedBox(height: iconSize, child: HintWidget(false, Image.asset('assets/text/article_pinglun@1.png'))),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text('评论', style: TextStyle(color: Color.fromRGBO(193, 193, 193, 1))),
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(height: iconSize, child: HintWidget(false, Image.asset('assets/text/article_zhuanfa@1.png'))),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text('转发', style: TextStyle(color: Color.fromRGBO(193, 193, 193, 1))),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  _onTabChange(index) {
    tabStatus = index;
    setState(() {});
  }

  _onFocusButtonTapped() {
    print('focus button tapped');
  }

  _onNavBar(BuildContext context, index) {
    if (index == 1) {
      _onCommentButtonPressed(context);
    } else {
      print('转发');
    }
  }

  _onCommentButtonPressed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CommentTextFieldSheet();
      }
    );
  }
}
