import 'package:flutter/material.dart';
import 'routers/routers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '今日头条',
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.blue,
      ),
      routes: getRouters(),
    );
  }
}
