import 'package:flutter/material.dart';

class MainBottomBar extends StatelessWidget {
  final List<Widget> items;

  MainBottomBar({
    @required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(110, 149, 253, 1),
        Color.fromRGBO(111, 222, 250, 1),
        Color.fromRGBO(141, 244, 97, 1),
        Color.fromRGBO(81, 232, 94, 1),
      ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
      child: Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: Color.fromRGBO(255, 255, 255, 0.3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: this.items,
        ),
      ),
    );
  }
}
