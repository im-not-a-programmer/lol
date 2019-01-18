import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../widgets/switch_appbar.dart';
import '../widgets/lol_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List introImages = [
    'assets/home/home_banner1.png',
    'assets/home/home_banner1.png',
    'assets/home/home_banner1.png',
    'assets/home/home_banner1.png',
  ];

  List cardData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: <Widget>[
          _buildIntroFigure(context),
          Expanded(child: _buildCardListView(context))
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return PreferredSize(
      child: SwitchAppBar(
        '关注',
        '热门',
        IconButton(
          iconSize: 8,
          alignment: Alignment.topCenter,
          icon: Image.asset('assets/home/home_photograph.png'),
          onPressed: _onCameraButtonPressed,
        ),
        _onFocusTabPressed,
        _onHotButtonPressed,
      ),
      preferredSize: Size.fromHeight(54),
    );
  }

  Widget _buildIntroFigure(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.width / 2,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.width / 4,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Swiper(

              autoplay: true,
              itemCount: introImages.length,
              itemBuilder: (context, index) {
                return Image.asset(introImages[index]);
              },
              curve: Curves.fastOutSlowIn,
              pagination: SwiperPagination(
                margin: EdgeInsets.all(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardListView(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
            child: LolCard(),
          );
        });
  }

  _onFocusTabPressed() {
    print('focus button pressed');
  }

  _onHotButtonPressed() {
    print('hot button pressed');
  }

  _onCameraButtonPressed(){
    print('camera button pressed');
  }
}

