import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/services/pokemon.service.dart';
import 'package:pokedex/ui/components/bottom-navigation/bottom-navigation.state.dart';
import 'package:pokedex/ui/components/header/header.dart';
import 'package:pokedex/ui/components/pokemon-list/pokemon-list.state.dart';
import 'package:pokedex/ui/pages/home/home.state.dart';

class Home extends State<HomeState> {

  String search;
  List<Pokemon> pokemonList;

  void getPokemonList() async {
    final response = await PokemonService().getPokemonList();

    List pokemonJsonList = response.data['pokemons'];

    setState(() {
      this.pokemonList = pokemonJsonList.map((pokeJson) => (
        Pokemon.fromJson(pokeJson)
      )).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    this.getPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.renderHomeBody(),

      bottomNavigationBar: AppBottomNavigationState(),
    );
  }

  void onChangeSearch(String search) {
    setState(() {
      this.search = search;
    });
  }

  Widget renderHomeBody() {
    return (
      Container(
        child: Column(
          children: <Widget>[

            Header(
              search: search,
              onChangeSearch: this.onChangeSearch
            ),

            this.pokemonList == null ?
              Container()
            :
              Expanded(
                child: PokemonListState(
                  pokemonList: this.pokemonList,
                )
              )

          ],
        ),
      )
    );
  }

}
