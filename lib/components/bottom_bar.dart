import 'package:flutter/material.dart';

final barMenu = [
	{
		'icon': 'lib/assets/images/home_icon1b.png',
		'activeIcon': 'lib/assets/images/home_icon1y.png',
		'title': '首页'
	},
	{
		'icon': 'lib/assets/images/home_icon2b.png',
		'activeIcon': 'lib/assets/images/home_icon2y.png',
		'title': '赛事'
	},
	{
		'icon': 'lib/assets/images/home_icon3b.png',
		'activeIcon': 'lib/assets/images/home_icon3y.png',
		'title': '发现'
	},
	{
		'icon': 'lib/assets/images/home_icon4b.png',
		'activeIcon': 'lib/assets/images/home_icon4y.png',
		'title': '消息'
	},
	{
		'icon': 'lib/assets/images/home_icon5b.png',
		'activeIcon': 'lib/assets/images/home_icon5y.png',
		'title': '我'
	}
];

class BottomBar extends StatefulWidget {
  	@override
		State<StatefulWidget> createState() {
			return _BottomBar();
		}
}

class _BottomBar extends State<BottomBar> {
	int _currentIndex = 0;
	void _onTapHandler (int index) {
		setState(() {
			_currentIndex = index;
		});
    // Navigator.of(context).pushNamed('/details');
	}
	
	@override
		Widget build(BuildContext context) {
			return BottomNavigationBar(
				type: BottomNavigationBarType.fixed,
				currentIndex: _currentIndex,
				onTap: _onTapHandler,
				items: barMenu.map((Map item) {
					return BottomNavigationBarItem(
						icon: new Image.asset(
							item['icon'],
							width: 20.0,
							height: 20.0
						),
						activeIcon: new Image.asset(
							item['activeIcon'],
							width: 20.0,
							height: 20.0
						),
						title: Text(item['title'])
					);
				}).toList()
			);
		}
}