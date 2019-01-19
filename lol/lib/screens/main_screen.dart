import 'package:flutter/material.dart';
import 'screens.dart';
import '../utils/continued.dart';
import '../widgets/hint_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _bottomNavigationBarList = <_BottomNavigationBarItemData>[
    _BottomNavigationBarItemData(
        'assets/home/home_icon1b.png', 'assets/home/home_icon1y.png', '首页'),
    _BottomNavigationBarItemData(
        'assets/home/home_icon2b.png', 'assets/home/home_icon2y.png', '赛事'),
    _BottomNavigationBarItemData(
        'assets/home/home_icon3b.png', 'assets/home/home_icon3y.png', '发现'),
    _BottomNavigationBarItemData(
        'assets/home/home_icon4b.png', 'assets/home/home_icon4y.png', '消息'),
    _BottomNavigationBarItemData(
        'assets/home/home_icon5b.png', 'assets/home/home_icon5y.png', '我'),
  ];
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _bottomNavigationBarList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: NotificationListener(
        onNotification: (ScrollEndNotification notification){
          _currentIndex = _tabController.index;
          _getToken(_currentIndex);
          setState(() {});
        },
        child: TabBarView(
          controller: _tabController, children: [
          HomeScreen(),
          EventScreen(),
          ExploreScreen(),
          MessageScreen(),
          ProfileScreen(),
        ],),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(size),
    );
  }

  Widget _buildBottomNavigationBar(Size size) {
    final iconSize = size.width/14;

    return BottomNavigationBar(
      fixedColor: Colors.orangeAccent,
      currentIndex: _currentIndex,
      onTap: _switchPage,
      type: BottomNavigationBarType.fixed,
      items: _bottomNavigationBarList
          .map((item) => BottomNavigationBarItem(
                icon: SizedBox(height: iconSize, child: Image.asset(item.icon)),
                activeIcon: SizedBox(
                    height: iconSize, child: HintWidget(true, Image.asset(item.activeIcon))),
                title: Text(item.title),
              ))
          .toList(),
    );
  }

  _switchPage(int index) {
    _currentIndex = index;
    _tabController.animateTo(index);
    _getToken(index);
    setState(() {});
  }

  _getToken(int index) {
    Sp.getToken((token) {
      if (token == null && index == 4) {
        Navigator.of(context).pushNamed('/login');
        _currentIndex = 0;
        _tabController.animateTo(_currentIndex);
      }
    });
  }

}

class _BottomNavigationBarItemData {
  final String icon;
  final String activeIcon;
  final String title;
  _BottomNavigationBarItemData(this.icon, this.activeIcon, this.title);
}
