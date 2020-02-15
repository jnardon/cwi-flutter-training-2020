import 'package:flutter/widgets.dart';
import 'package:pokemon/models/pokemonType.dart';

class TypeIcon extends StatelessWidget {
  PokemonType pokemonType;

  TypeIcon({@required this.pokemonType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: pokemonType.color,
      ),
      child: Container(
        width: 15,
        height: 15,
        child: Image.asset(pokemonType.imagePath),
      ),
    );
  }
}
