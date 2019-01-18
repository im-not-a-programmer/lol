import 'package:flutter/material.dart';

var tabs = [
  {
    'title': '关注',
    'url':
        'https://recommender-api-ms.juejin.im/v1/get_recommended_entry?suid=V77uAujvbZmYBbN3mJ37&ab=welcome_3&src=web',
    'type': 'INDEX'
  },
  {
    'title': '热门',
    'url':
        'https://timeline-merger-ms.juejin.im/v1/get_entry_by_rank?src=web&limit=20&category=5562b415e4b00c57d9b94ac8',
    'type': 'FE'
  }
];

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: TabBar(
        unselectedLabelColor: Colors.white54,
        labelColor: Colors.yellow,
        indicatorColor: Colors.transparent,
        labelStyle: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        unselectedLabelStyle:
            new TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        tabs: tabs.map((Map item) {
          return Tab(child: Text(item['title']));
        }).toList(),
      ),
      actions: <Widget>[
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.camera_alt),
          tooltip: 'Air it',
          onPressed: () => debugPrint('拍照'),
        ),
      ],
    );
  }
}
