import 'package:flutter/material.dart';

class Follow extends StatefulWidget {
	@override
	createState() => new IndexItemState();
}

class IndexItemState extends State<Follow> {
	IndexItemState();
	List<Object> list = [];

	Future<Null> _getList () async {
		_get();
		return;
	}
	_get () {
		list.clear();
		list.add({
			'collectionCount': 2,
			'title': 222,
			'user': '22',
			'username': '222',
			'screenshot': 'https://upload-images.jianshu.io/upload_images/10878817-836b48109667602d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1000/format/webp'
		});

		setState(() {
			list: list;
		});
	}
	@override
	void initState() {
		_get();
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		return RefreshIndicator(
			child: new ListView(
				children: list.map((Object item) {
					return GestureDetector(
						child: Column(
							children: <Widget>[
								Divider(),
								new ListTile(
									title: Text('这是一个标题'),
									subtitle: Text('这是一个内容'),
									trailing: Text('这是一个什么鬼')
								),
							],
						),
						onTap: () {
							Navigator.of(context).pushNamed('/details');
						},
					);
				}).toList(),
			),
			onRefresh: _getList
		);
	}
}
