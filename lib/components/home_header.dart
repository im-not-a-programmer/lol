import 'package:flutter/material.dart';

final tabs = [
  {
    'title': '关注',
    'url':
        'https://timeline-merger-ms.juejin.im/v1/get_entry_by_rank?src=web&limit=20&category=5562b415e4b00c57d9b94ac8',
    'type': 'FE'
  },
  {
    'title': '热门',
    'url':
        'https://timeline-merger-ms.juejin.im/v1/get_entry_by_rank?src=web&limit=20&category=5562b415e4b00c57d9b94ac8',
    'type': 'FE'
  }
];
// implements PreferredSizeWidget
class HomeHeader extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return AppBar(
			backgroundColor: Colors.black,
			title: TabBar(
				unselectedLabelColor: Colors.white54,
				labelColor: Colors.yellow,
				indicatorColor: Colors.transparent,
				labelStyle: new TextStyle(
					fontSize: 18.0, fontWeight: FontWeight.bold),
				unselectedLabelStyle: new TextStyle(
					fontSize: 14.0, fontWeight: FontWeight.bold),
				tabs: tabs.map((Map item) {
				return Tab(child: Text(item['title'], style: TextStyle()));
				}).toList(),
			),
			actions: <Widget>[
				IconButton(
				color: Colors.white,
				icon: new Image.asset(
					'lib/assets/images/home_photograph.png',
					width: 20.0,
					height: 20.0),
				tooltip: 'Air it',
				onPressed: () => debugPrint('拍照'),
				),
			],
		);
	}
}