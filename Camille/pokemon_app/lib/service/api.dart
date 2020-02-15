import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/models/stats.dart';
import 'package:pokemon_app/models/types.dart';

class Api {
  static getList() async {
    final response = await Dio().get("http://localhost:3000/list");
    final data = JsonDecoder().convert(response.toString());

    List<Pokemon> _pokemons = [];

    data['pokemons'].forEach((key) {
      Pokemon pokemon = Pokemon.fromJSON(key);
      List<Types> types = [];

      key['types'].forEach((key) {
        Types type = Types.values
            .firstWhere((value) => value.toString() == 'Types.$key');
        types.add(type);
      });

      pokemon.types = types;
      _pokemons.add(pokemon);
    });

    return _pokemons;
  }

  static getDetail(id) async {
    final response = await Dio().get("http://localhost:3000/details/$id");
    final data = JsonDecoder().convert(response.toString());

    List<Stats> _stats = [];

    data['stats'].forEach((key) {
      Stats stats = Stats.fromJSON(key);
      _stats.add(stats);
    });

    List<Types> types = [];

    data['types'].forEach((key) {
      Types type =
      Types.values.firstWhere((value) => value.toString() == 'Types.$key');
      types.add(type);
    });

    Pokemon _pokemon = Pokemon.fromJSON(data);
    _pokemon.stats = _stats;
    _pokemon.types = types;

    return _pokemon;
  }
}