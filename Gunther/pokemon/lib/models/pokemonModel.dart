import 'package:pokemon/models/pokemonStatModel.dart';
import 'package:pokemon/models/pokemonType.dart';

class PokemonModel {
  String name;
  String id;
  List<PokemonType> types;
  String image;
  List<PokemonStatModel> stats;
  String description;

  PokemonModel.fromJson(Map jsonMap)
      : assert(jsonMap != null),
        name = jsonMap['name'],
        id = jsonMap['id'],
        types = jsonMap['types']
            .map<PokemonType>((dynamic data) => getTypeByName(data))
            .toList(),
        image = jsonMap['image'],
        stats = jsonMap.containsKey('stats')
            ? jsonMap['stats']
                .map<PokemonStatModel>(
                    (dynamic data) => PokemonStatModel.fromJson(data))
                .toList()
            : null,
        description = jsonMap['description'];

  static PokemonType getTypeByName(String name) {
    switch (name) {
      case 'grass':
        return PokemonType.grass;
      case 'poison':
        return PokemonType.poison;
      case 'fire':
        return PokemonType.fire;
      case 'flying':
        return PokemonType.flying;
      case 'water':
        return PokemonType.water;
      case 'bug':
        return PokemonType.bug;
      case 'normal':
        return PokemonType.normal;
      case 'electric':
        return PokemonType.electric;
    }
    return null;
  }
}
