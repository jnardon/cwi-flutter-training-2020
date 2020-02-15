import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PokemonType extends StatelessWidget {

  final String type;
  final Color color;

  PokemonType({
    @required this.type,
    @required this.color
  });

  @override
  Widget build(BuildContext context) {
    return (
      Container(
        width: 115,
        height: 45,

        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Image.asset(
              'assets/images/types/${this.type}.png'
            ),

            Text(
              this.type.toString().toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        )
      )
    );
  }

}
