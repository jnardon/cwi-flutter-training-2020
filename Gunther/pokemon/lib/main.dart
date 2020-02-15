import 'package:flutter/material.dart';
import 'package:pokemon/pages/pokemonListPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon',
      home: PokemonListPage(),
    );
  }
}
