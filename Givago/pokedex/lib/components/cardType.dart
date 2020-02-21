import 'package:flutter/material.dart';

class CardType extends StatelessWidget {
  String pokemonType;
  bool bigCard = false;

  CardType({this.pokemonType, this.bigCard}) : assert(pokemonType != null);

  Color _getColor() {
    switch (pokemonType) {
      case 'bug':
        return Colors.lightGreenAccent;
      case 'electric':
        return Colors.yellow;
      case 'fire':
        return Colors.red;
      case 'flying':
        return Colors.lightBlueAccent;
      case 'grass':
        return Colors.green;
      case 'normal':
        return Colors.grey;
      case 'poison':
        return Colors.purpleAccent;
      case 'water':
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: _getColor(),
      ),
      child: ImageIcon(
        AssetImage('assets/types/$pokemonType.png'),
        color: Colors.white,
      ),
    );
  }
}
