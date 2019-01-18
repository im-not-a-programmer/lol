import 'package:flutter/material.dart';
import './views/home/index.dart';
import './views/details.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
		title: 'wb',
		theme: new ThemeData(
			primarySwatch: Colors.blue,
		),
		home: new Home(),
		routes: <String, WidgetBuilder> {
			'/details': (BuildContext context) => new Details()
		}
	);
  }
}