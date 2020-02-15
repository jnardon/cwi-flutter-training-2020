import 'package:flutter/material.dart';

class StatsProgress extends StatelessWidget {
  String name;
  int value;
  Color color;

  StatsProgress({this.name, this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 10, 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(name),
            flex: 4,
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(value.toString()),
            ),
          ),
          Expanded(
            flex: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 200,
                height: 10,
                child: LinearProgressIndicator(
                  backgroundColor: Color.fromRGBO(240, 240, 240, 1),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    color,
                  ),
                  value: (value / 100),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
