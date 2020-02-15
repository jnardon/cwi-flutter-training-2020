import 'dart:convert';

class PokemonStatModel {
  String name;
  int value;

  PokemonStatModel.fromJson(Map jsonMap)
      : assert(jsonMap != null),
        name = jsonMap['name'],
        value = jsonMap['value'];
}