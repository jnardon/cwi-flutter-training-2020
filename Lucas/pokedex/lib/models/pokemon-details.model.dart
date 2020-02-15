import 'package:flutter/cupertino.dart';

class PokemonDetails {

  int id;
  String name;
  List types;
  String imageUrl;
  List stats;
  String description;

  PokemonDetails({
    @required this.id,
    @required this.name,
    @required this.types,
    @required this.imageUrl,
    @required this.stats,
    @required this.description,
  });

  PokemonDetails.fromJson(Map jsonMap) 
    : assert(jsonMap['id'] != null),
      this.id = int.parse(jsonMap['id']),
      this.name = jsonMap['name'],
      this.types = jsonMap['types'].toList(),
      this.imageUrl = jsonMap['image'],
      this.stats = jsonMap['stats'].toList(),
      this.description = jsonMap['description'];

}
