import 'package:flutter/material.dart';

class PokemonTypeTag extends StatelessWidget {
  final List<Color> gradientColors;
  final String typeName;
  final ImageProvider typeIcon;

  PokemonTypeTag({
    @required this.typeName,
    @required this.typeIcon,
    @required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          gradient: LinearGradient(colors: gradientColors)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ImageIcon(
            typeIcon,
            size: 15,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            typeName.toUpperCase(),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
