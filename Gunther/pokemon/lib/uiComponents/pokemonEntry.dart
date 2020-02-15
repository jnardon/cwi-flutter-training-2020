import 'package:flutter/widgets.dart';
import 'package:pokemon/models/pokemonModel.dart';
import 'package:pokemon/uiComponents/typeIcon.dart';

class PokemonEntry extends StatelessWidget {
  PokemonModel pokemon;

  PokemonEntry({@required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 50,
              height: 50,
              child: Image.network(pokemon.image),
            ),
            Container(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(pokemon.name),
                Text("#${pokemon.id.padLeft(3, "0")}"),
              ],
            ),
            Spacer(),
            Row(
              children: pokemon.types
                  .map((type) => TypeIcon(
                pokemonType: type,
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
