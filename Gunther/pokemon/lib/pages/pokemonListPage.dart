import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon/models/pokemonModel.dart';
import 'package:pokemon/uiComponents/dividerVertical.dart';
import 'package:pokemon/uiComponents/loader.dart';
import 'package:pokemon/uiComponents/pokemonEntry.dart';

class PokemonListPage extends StatefulWidget {
  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  bool _isLoading = true;
  List<PokemonModel> _pokemonList = [];

  @override
  void initState() {
    _loadPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokemon"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Image.asset("assets/images/ic_pokemon.png"),
                title: Text("Pokemon")),
            BottomNavigationBarItem(
                icon: Image.asset("assets/images/ic_moves.png"),
                title: Text("Moves")),
            BottomNavigationBarItem(
                icon: Image.asset("assets/images/ic_itens.png"),
                title: Text("Itens")),
          ],
        ),
        body: _isLoading
            ? Loader()
            : Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => PokemonEntry(
                        pokemon: _pokemonList[index],
                      ),
                      separatorBuilder: (context, index) => DividerVertical(),
                      itemCount: _pokemonList.length,
                    ),
                  ),
                ],
              ));
  }

  void _loadPokemons() async {
    try {
      Response response = await Dio().get("http://10.99.197.141:3000/list");
      final jsonMap = JsonDecoder().convert(response.toString());
      final pokemonList = jsonMap['pokemons']
          .map<PokemonModel>(
              (dynamic data) => PokemonModel.fromJson(data))
          .toList();
      setState(() {
        _isLoading = false;
        _pokemonList = pokemonList;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _pokemonList = [];
        print('$e');
      });
    }
  }
}
