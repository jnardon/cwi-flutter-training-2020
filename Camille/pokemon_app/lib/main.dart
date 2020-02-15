import 'package:flutter/material.dart';
import 'package:pokemon_app/pages/listPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.white),
          bottomAppBarTheme:
              BottomAppBarTheme(color: Colors.white, elevation: 0.0)),
      home: ListPage(),
    );
  }
}
