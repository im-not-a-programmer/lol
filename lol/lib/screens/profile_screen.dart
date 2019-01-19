import 'package:flutter/material.dart';
import '../widgets/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  final String iconPeople = 'assets/my/my_tjhy.png';
  final String iconCamera = 'assets/my/my_photo.png';
  final String iconHead = 'assets/home/home_head.png';
  final String iconStory = 'assets/my/my_story.png';
  final String iconPhoto = 'assets/my/my_myphoto.png';
  final String iconTeam = 'assets/my/my_myteam.png';
  final String iconGame = 'assets/my/my_mygame.png';
  final String iconMatch = 'assets/my/my_match.png';
  final String iconSetting = 'assets/my/my_setting.png';
  final String name = '浮生';
  final String iconVip = 'assets/my/my_vip2.png';
  final String intro = '二次元棋圣 奥义电竞签约艺人';
  final String focus = '28';
  final String fans = '1235万';
  final String agp = '28';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      physics: ScrollPhysics(),
      padding: EdgeInsets.all(0),
      children: <Widget>[
        Container(
          height: size.width / 1.8,
          width: size.width,
          color: Colors.black,
          child: SafeArea(
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                    top: 12,
                    left: 24,
                    child: _buildLeadingIcon(iconPeople, size)),
                Positioned(
                    top: 12,
                    right: 24,
                    child: Row(
                      children: <Widget>[
                        _buildLeadingIcon(iconCamera, size),
                        SizedBox(
                          width: 24,
                        ),
                        _buildLeadingIcon(iconSetting, size)
                      ],
                    )),
              ],
            ),
          ),
        ),
        Container(
          height: size.width / 3.4,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                  left: 0,
                  right: 0,
                  top: -size.width / 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildProfileCard(size),
                  )),
            ],
          ),
        ),
        _buildActionRow(size),
        Padding(
          padding: const EdgeInsets.only(
            top: 12,
            left: 12,
            right: 12,
          ),
          child: MyGame(),
        ),
      ],
    ));
  }

  Widget _buildLeadingIcon(String icon, Size size) {
    return SizedBox(height: size.width / 18, child: Image.asset(icon));
  }

  Widget _buildProfileCard(Size size) {
    final width = size.width;
    final profilaImageSize = width/4;
    final nomalFontSize = width/28;
    final titleFontSize = width/21;

    return SizedBox(
      height: size.width / 2,
      child: Card(
        color: Colors.white,
        child: Stack(
          overflow: Overflow.visible,
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              width: width - 16,
              top: -width/8,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        width: profilaImageSize, height: profilaImageSize, child: ProfileWidget(iconHead)),
                    SizedBox(
                      height: width/50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '$name',
                              style: TextStyle(
                                  fontSize: titleFontSize, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                                height: width/24,
                                width: width/20,
                                child: Image.asset('$iconVip'))
                          ],
                        ),
                        Text('$intro',style: TextStyle(fontSize: nomalFontSize),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buildTextColumn(focus, '关注',size),
                            _buildRotateDivider(),
                            _buildTextColumn(fans, '粉丝',size),
                            _buildRotateDivider(),
                            _buildTextColumn(agp, 'AGP',size),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextColumn(String text1, String text2,Size size) {
    return Column(
      children: <Widget>[
        Text(
          '$text1',
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width/24),
        ),
        Text('$text2'),
      ],
    );
  }

  Widget _buildRotateDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: SizedBox(
          height: 32,
          child: RotatedBox(
            quarterTurns: 45,
            child: Divider(),
          )),
    );
  }

  Widget _buildActionRow(Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 12,right: 12),
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildActionColumn(iconGame, "我的故事", size),
            _buildActionColumn(iconPhoto, "我的故事", size),
            _buildActionColumn(iconTeam, "我的战队", size),
            _buildActionColumn(iconMatch, "我的比赛", size),
          ],
        ),
      ),
    );
  }

  Widget _buildActionColumn(String image, String title, Size size) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: size.width / 6,
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(16),
                height: size.width / 6,
                child: Image.asset(image)),
            SizedBox(
              height: 8,
            ),
            Text('$title')
          ],
        ),
      ),
    );
  }
}

class MyGame extends StatefulWidget {
  final bool hasGame = false;
  @override
  _MyGameState createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '我的比赛',
              style: TextStyle(fontSize: 18),
            ),
            Divider(),
            widget.hasGame
                ? Container()
                : Align(
                    child: Text(
                      '暂无任何比赛',
                      style: TextStyle(color: Colors.grey),
                    ),
                    alignment: Alignment.center,
                  )
          ],
        ),
      ),
    );
  }
}
