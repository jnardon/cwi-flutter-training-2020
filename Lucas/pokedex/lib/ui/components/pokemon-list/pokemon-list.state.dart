import 'package:flutter/widgets.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/ui/components/pokemon-list/pokemon-list.dart';

class PokemonListState extends StatefulWidget {

  final List<Pokemon> pokemonList;

  PokemonListState({
    @required this.pokemonList
  });

  @override
  State<StatefulWidget> createState() => PokemonList(pokemonList: this.pokemonList,);

}
