import 'package:pokedex/models/pokemonModel.dart';
import 'package:pokedex/models/pokemonStatusModel.dart';

class PokemonDescriptionModel {
  String description;
  PokemonModel pokemonModel;
  List<PokemonStatusModel> pokemonStatusModel;

  PokemonDescriptionModel.fromJson(Map<String, dynamic> json)
      : assert(json != null) {
    pokemonModel = PokemonModel.fromJson(json);
    description = json['description'];

    final stats = json['stats'] as List<dynamic>;
    pokemonStatusModel = stats.map((stat) {
      return PokemonStatusModel.fromJson(stat);
    }).toList();
  }
}
