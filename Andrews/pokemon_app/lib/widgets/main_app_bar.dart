import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(110, 149, 253, 1),
          Color.fromRGBO(111, 222, 250, 1),
          Color.fromRGBO(141, 244, 97, 1),
          Color.fromRGBO(81, 232, 94, 1),
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          color: Color.fromRGBO(255, 255, 255, 0.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Text(
                'Pokemon',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 36,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 10),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic),
                    filled: true,
                    fillColor: Color.fromRGBO(0, 0, 0, 0.12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all((Radius.circular(50)))),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
