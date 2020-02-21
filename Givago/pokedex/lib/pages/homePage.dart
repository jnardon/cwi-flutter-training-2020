import 'package:flutter/material.dart';
import 'package:pokedex/components/cardMove.dart';
import 'package:pokedex/models/movesModel.dart';
import 'package:pokedex/models/pokemonModel.dart';
import 'package:pokedex/services/pokemonService.dart';
import 'package:pokedex/components/mainAppBar.dart';
import 'package:pokedex/components/cardPokemon.dart';
import 'package:pokedex/components/mainBottomBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pokemonService = PokemonService();
  int currentIndex = 1;
  List<PokemonModel> _pokemonList;
  List<MovesModel> _movesList;
  bool isLoading = true;

  @override
  void initState() {
    getPokemons();
    super.initState();
  }

  void getPokemons() async {
    final json = await _pokemonService.getListPokemon();

    setState(() {
      _pokemonList = json;
      isLoading = false;
    });
  }

  void getMoves() async {
    final json = await _pokemonService.getListMoves();

    setState(() {
      _movesList = json;
      isLoading = false;
    });
  }

  void changeList(int index) {
    if (index == 1) {
      if (_pokemonList == null) {
        getPokemons();
      }
    } else if (index == 2) {
      if (_movesList == null) {
        getMoves();
      }
    } else {}

    setState(() {
      currentIndex = index;
    });
  }

  Widget getList() {
    if (currentIndex == 1) {
      return getWidgetsPokemonList();
    } else if (currentIndex == 2) {
      return getWidgetsMoveList();
    } else {
      return Container();
    }
  }

  Widget getWidgetsMoveList() {
    if (_movesList != null && _movesList.length > 0) {
      return Expanded(
        child: ListView.builder(
          itemCount: _movesList.length,
          itemBuilder: (BuildContext context, int index) {
            MovesModel currentMove = _movesList[index];
            return CardMove(
              name: currentMove.name,
              type: currentMove.type,
              learnLevel: currentMove.learnLevel,
            );
          },
        ),
      );
    } else {
      return Container();
    }
  }

  Widget getWidgetsPokemonList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _pokemonList.length,
        itemBuilder: (BuildContext context, int index) {
          PokemonModel currentPokemon = _pokemonList[index];
          return CardPokemon(
            name: currentPokemon.name,
            id: currentPokemon.id,
            image: currentPokemon.image,
            types: currentPokemon.types,
          );
        },
      ),
    );
  }

  Widget getHome() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.0138, 0.2798, 0.5905, 0.8726],
          colors: [
            Color(0xff6E95FD),
            Color(0xff6FDEFA),
            Color(0xff8DE061),
            Color(0xff51E85E),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MainAppBar(),
          getList(),
          MainBottomBar(
            changeMoveList: () => changeList(2),
            changePokemonList: () => changeList(1),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: isLoading ? Container() : getHome());
  }
}
