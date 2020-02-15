import 'package:flutter/material.dart';

class Type extends StatelessWidget {
  Color color;
  String icon;

  Type({this.color, this.icon});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: 8.0,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Image.asset(icon),
      ),
    );
  }
}
