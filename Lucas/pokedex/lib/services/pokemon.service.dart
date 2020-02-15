import 'package:dio/dio.dart';

class PokemonService {

  Dio dio = new Dio();

  String baseAdress = 'http://10.99.196.185:3000';

  Future<Response> _get(String url) {

    try {
      
      final response = dio.get(url);
      return response;

    } catch (e) {
      return e;
    }

  }

  Future<Response> getPokemonList() async {
    String pokemonListUrl = '$baseAdress/list';

    return await this._get(pokemonListUrl);
  }

  Future<Response> getPokemonDetailsById(int id) async {
    String pokemontUrl = '$baseAdress/details/$id';

    return await this._get(pokemontUrl);
  }


}
