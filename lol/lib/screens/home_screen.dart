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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: _buildAppBar(),
    body: ListView.builder(
        physics: ClampingScrollPhysics(),
        //实际只会有9个card因为又一个被头部轮播图占了
        itemCount: 10,
        itemBuilder: (context,index){
          if(index == 0)return _buildIntroFigure(context);
          else return _buildCard();
    }),
    );
  }

  Widget _buildAppBar() {
    return PreferredSize(
      child: SwitchAppBar(
        '关注',
        '热门',
        IconButton(
          padding: EdgeInsets.all(12),
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
                  builder: DotSwiperPaginationBuilder(
                    color: Color.fromRGBO(250, 250, 250, 0.7),
                    activeColor: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
      child: LolCard([]),
    );
  }

  _onFocusTabPressed() {
    print('focus button pressed');
  }

  _onHotButtonPressed() {
    print('hot button pressed');
  }

  _onCameraButtonPressed() {
    print('camera button pressed');
  }
}
