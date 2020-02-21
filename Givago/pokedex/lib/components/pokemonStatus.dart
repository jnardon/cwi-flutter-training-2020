import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemonStatusModel.dart';

class PokemonStatus extends StatelessWidget {
  Color color;
  List<dynamic> pokemonStatusModel;

  PokemonStatus({this.color, this.pokemonStatusModel})
      : assert(color != null, pokemonStatusModel != null);

  String _getNameStat(String name) {
    switch (name) {
      case "speed":
        return "spd";
      case "special-defense":
        return "sdef";
      case "special-attack":
        return "satk";
      case "defense":
        return "def";
      case "attack":
        return "atk";
      case "hp":
        return name;
      default:
        if (name.length > 4)
          return name.substring(0, 4);
        else
          return name;
    }
  }

  Widget _getLinearBar(
      BuildContext context, PokemonStatusModel pokemonStatusModel) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            _getNameStat(pokemonStatusModel.name).toUpperCase(),
            style: TextStyle(color: color, fontSize: 12),
          ),
          Text(
            pokemonStatusModel.value.toString(),
            style: TextStyle(fontSize: 14),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 8,
              width: MediaQuery.of(context).size.width * .6,
              child: LinearProgressIndicator(
                value: (pokemonStatusModel.value / 100),
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
              child: Text(
                'Status',
                style: TextStyle(color: color, fontSize: 14),
              ),
            ),
            Column(
              children: pokemonStatusModel
                  .map((status) => _getLinearBar(context, status))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
