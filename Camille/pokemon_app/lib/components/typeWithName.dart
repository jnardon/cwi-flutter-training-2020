import 'package:flutter/material.dart';

class TypeWithName extends StatelessWidget {
  Color color;
  String icon;
  String name;

  TypeWithName({this.color, this.icon, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 130,
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: color,
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: 8.0,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(icon),
            ),
            Text(
              name.toUpperCase(),
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
