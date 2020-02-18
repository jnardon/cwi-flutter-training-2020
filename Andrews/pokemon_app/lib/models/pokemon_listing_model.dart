import 'package:flutter/material.dart';

class PokemonListingModel {
  final String name;
  final String imageUrl;
  final String id;
  final List<dynamic> types;

  PokemonListingModel({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.types,
  });
}
