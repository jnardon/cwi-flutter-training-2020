import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon_stats_model.dart';

class PokemonDetailModel {
  final String name;
  final String imageUrl;
  final String id;
  final List<dynamic> types;
  final List<PokemonStatsModel> stats;
  final String description;

  PokemonDetailModel({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.types,
    @required this.stats,
    @required this.description,
  });
}
