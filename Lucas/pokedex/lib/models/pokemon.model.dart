import 'package:flutter/cupertino.dart';

class Pokemon {

  int id;
  String name;
  List types;
  String imageUrl;

  Pokemon({
    @required this.id,
    @required this.name,
    @required this.types,
    @required this.imageUrl,
  });

  Pokemon.fromJson(Map jsonMap) 
    : assert(jsonMap['id'] != null),
      this.id = int.parse(jsonMap['id']),
      this.name = jsonMap['name'],
      this.types = jsonMap['types'].toList(),
      this.imageUrl = jsonMap['image'];

}
