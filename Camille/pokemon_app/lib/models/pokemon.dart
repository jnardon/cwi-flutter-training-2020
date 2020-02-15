import 'package:pokemon_app/models/stats.dart';
import 'package:pokemon_app/models/types.dart';

class Pokemon {
  String name;
  String id;
  String image;
  List<Types> types;
  List<Stats> stats;
  String description;

  Pokemon(
      {this.name,
      this.id,
      this.image,
      this.types,
      this.description,
      this.stats});

  Pokemon.fromJSON(Map json)
      : name = json['name'],
        id = json['id'],
        image = json['image'],
        description = json['description'];
}
