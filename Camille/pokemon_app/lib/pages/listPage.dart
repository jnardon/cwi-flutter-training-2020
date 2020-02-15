import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:pokemon_app/components/loader.dart';
import 'package:pokemon_app/components/pokemonCard.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/models/types.dart';
import 'package:pokemon_app/pages/detailPage.dart';
import 'package:pokemon_app/service/api.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Pokemon> pokemons = [];

  _getPokemons() async {
    List<Pokemon> _pokemons = await Api.getList();

    setState(() {
      pokemons = _pokemons;
    });
  }

  @override
  void initState() {
    super.initState();
    _getPokemons();
  }

  _goToDetailPage(Pokemon pokemon) {
    Types firstType = pokemon.types[0];
    Color color = firstType.color;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(
                id: pokemon.id, color: color, image: pokemon.image)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          'Pokemon',
          style: TextStyle(color: Colors.black),
        ),
        gradient: LinearGradient(colors: [
          Color.fromRGBO(110, 149, 253, 0.3),
          Color.fromRGBO(111, 222, 250, 0.3),
          Color.fromRGBO(141, 224, 97, 0.3),
          Color.fromRGBO(81, 232, 94, 0.3)
        ]),
      ),
      bottomNavigationBar: GradientBottomNavigationBar(
        backgroundColorStart: Color.fromRGBO(110, 149, 253, 0.5),
        backgroundColorEnd: Color.fromRGBO(81, 232, 94, 0.5),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            title: Text(
              "Pokemon",
              style: TextStyle(fontSize: 10),
            ),
            icon: Image.asset(
              "assets/icons/pokemon.png",
              width: 28,
            ),
          ),
          BottomNavigationBarItem(
              title: Text("Moves", style: TextStyle(fontSize: 10)),
              icon: Image.asset("assets/icons/moves.png", width: 28)),
          BottomNavigationBarItem(
              title: Text("Itens", style: TextStyle(fontSize: 10)),
              icon: Image.asset("assets/icons/sweet.png", width: 28)),
        ],
      ),
      body: getContent(),
    );
  }

  Widget getContent() {
    if (pokemons.length == 0) {
      return Loader();
    }

    return ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (BuildContext context, int index) {
          return PokemonCard(
            imageUrl: pokemons[index].image,
            id: pokemons[index].id,
            name: pokemons[index].name,
            types: pokemons[index].types,
            onTap: () {
              _goToDetailPage(pokemons[index]);
            },
          );
        });
  }
}
