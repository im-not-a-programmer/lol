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
        body: Column(
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
                    top: 8, left: 24, child: _buildLeadingIcon(iconPeople,size)),
                Positioned(
                    top: 8,
                    right: 24,
                    child: Row(
                      children: <Widget>[
                        _buildLeadingIcon(iconCamera,size),
                        SizedBox(
                          width: 24,
                        ),
                        _buildLeadingIcon(iconSetting,size)
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
        MyGame(),
      ],
    ));
  }

  Widget _buildLeadingIcon(String icon,Size size) {
    return SizedBox(height: size.width/18, child: Image.asset(icon));
  }

  Widget _buildProfileCard(Size size) {
    return SizedBox(
      height: size.width / 2,
      child: Card(
        color: Colors.white,
        child: Stack(
          overflow: Overflow.visible,
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              width: size.width - 16,
              top: -48,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        width: 96, height: 96, child: ProfileWidget(iconHead)),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$name',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                            height: 18,
                            width: 24,
                            child: Image.asset('$iconVip'))
                      ],
                    ),
                    Text('$intro'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildTextColunm(focus, '关注'),
                          _buildRotateDivider(),
                          _buildTextColunm(fans, '粉丝'),
                          _buildRotateDivider(),
                          _buildTextColunm(agp, 'AGP'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextColunm(String text1, String text2) {
    return Column(
      children: <Widget>[
        Text(
          '$text1',
          style: TextStyle(fontWeight: FontWeight.bold),
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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildActionColumn(iconGame, "我的故事",size),
            _buildActionColumn(iconPhoto, "我的故事",size),
            _buildActionColumn(iconTeam, "我的战队",size),
            _buildActionColumn(iconMatch, "我的比赛",size),
          ],
        ),
      ),
    );
  }

  Widget _buildActionColumn(String image, String title,Size size) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: size.width/6,
        child: Column(
          children: <Widget>[
            SizedBox(height: size.width/12, width: 88, child: Image.asset(image)),
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

    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
      ),
      child: Container(
        height: size.width / 4,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('我的比赛',style: TextStyle(fontSize: 18),),
              Divider(),
              widget.hasGame
                  ?Container()
                  :Align(child: Text('暂无任何比赛',style: TextStyle(color: Colors.grey),),alignment: Alignment.center,)
            ],
          ),
        ),
      ),
    );
  }
}

