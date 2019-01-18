import 'package:flutter/material.dart';
import '../../components/bottom_bar.dart';
import './children/follow.dart';

class Home extends StatelessWidget {
  	@override
  	Widget build(BuildContext context) {
    	return MaterialApp(
			theme: ThemeData(primaryColor: Color.fromRGBO(255, 170, 0, 1.0)),
			home: DefaultTabController(
				length: 2,
				child: Scaffold(
					appBar: AppBar(
						backgroundColor: Colors.black,
						title: TabBar(
							unselectedLabelColor: Colors.white54,
							labelColor: Colors.yellow,
							indicatorColor: Colors.transparent,
							labelStyle: new TextStyle(
								fontSize: 18.0,
								fontWeight: FontWeight.bold
							),
							unselectedLabelStyle: new TextStyle(
								fontSize: 14.0,
								fontWeight: FontWeight.bold
							),
							tabs: [
								Tab(child: Text('关注')),
								Tab(child: Text('热门'))
							],
						),
						actions: <Widget>[
							IconButton(
								color: Colors.white,
								icon: new Image.asset(
									'lib/assets/images/home_photograph.png',
									width: 20.0,
									height: 20.0
								),
								tooltip: 'Air it',
								onPressed: () => debugPrint('拍照'),
							),
						],
					),
						body: new Padding(
							padding: const EdgeInsets.all(8.0),
							child: TabBarView(
								children: <Widget> [
									Follow(),
									Follow()
								],
							),
						),
					bottomNavigationBar: BottomBar(),
				)
			)
		);
  	}
}
