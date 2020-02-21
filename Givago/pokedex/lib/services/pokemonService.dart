import 'package:dio/dio.dart';
import 'package:pokedex/models/movesModel.dart';
import 'package:pokedex/models/pokemonDescriptionModel.dart';
import 'package:pokedex/models/pokemonModel.dart';

class PokemonService {
  final baseUrl = 'http://localhost:3000/';
  final dio = Dio();

  Future<List<MovesModel>> getListMoves() async {
    try {
      final Response response = await dio.get('${baseUrl}moves');
      final List data = response.data;
      return data.map((move) => MovesModel.fromJson(move)).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<List<PokemonModel>> getListPokemon() async {
    try {
      final Response response = await dio.get('${baseUrl}list');
      final List data = response.data['pokemons'];

      return data.map((pokemon) => PokemonModel.fromJson(pokemon)).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<PokemonDescriptionModel> getPokemonDescription(String id) async {
    try {
      final Response response = await dio.get('${baseUrl}details/$id');
      return PokemonDescriptionModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}
