import 'package:flutter/material.dart';

class MainBottomCard extends StatelessWidget {
  String name;
  String imageName;
  Function function;

  MainBottomCard({this.name, this.imageName, this.function})
      : assert(name != null && imageName != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RawMaterialButton(
        onPressed: function,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ImageIcon(
              AssetImage('assets/buttons/$imageName.png'),
            ),
            Text(name),
          ],
        ),
      ),
    );
  }
}
