import 'package:dio/dio.dart';
import 'package:pokemon_app/enums/pokemon_stats.dart';
import 'package:pokemon_app/enums/pokemon_stats_extension.dart';
import 'package:pokemon_app/models/pokemon_details_model.dart';
import 'package:pokemon_app/models/pokemon_listing_model.dart';
import 'package:pokemon_app/models/pokemon_stats_model.dart';
import 'package:pokemon_app/services/base_service.dart';

class PokemonService {
  final _baseUrl = BaseService().baseUrl;
  final _dio = Dio();

  Future<List<PokemonListingModel>> getPokemons() async {
    final Response response = await _dio.get('${_baseUrl}list');
    final List data = response.data['pokemons'];

    List<PokemonListingModel> pokemons = data.map((pokemon) {
      final typesData = pokemon['types'] as List;

      return PokemonListingModel(
        id: pokemon['id'],
        name: pokemon['name'],
        types: typesData,
        imageUrl: pokemon['image'],
      );
    }).toList();

    return pokemons;
  }

  Future<PokemonDetailModel> getPokemonDetails(String id) async {
    final Response response = await _dio.get('${_baseUrl}details/$id');
    final types = response.data['types'];
    final statsData = response.data['stats'] as List;

    return PokemonDetailModel(
      id: id,
      name: response.data['name'],
      description: response.data['description'],
      imageUrl: response.data['image'],
      types: types,
      stats: statsData
          .map((stat) => PokemonStatsModel(
                name: PokemonStatsExtension.parseToStats(stat['name']),
                value: stat['value'],
              ))
          .toList(),
    );
  }
}
