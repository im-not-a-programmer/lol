import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        buttonColor: Colors.black,
        scaffoldBackgroundColor: Colors.white.withOpacity(0.7),
      ),
      home: MainScreen(),
      routes: <String, WidgetBuilder> {
        '/login': (_) => new LoginScreen(),
      },
    );
  }
}
