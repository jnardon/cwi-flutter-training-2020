import 'package:flutter/material.dart';
import 'package:pokemon_app/pages/hero_transition_page.dart';
import 'package:pokemon_app/pages/home_page.dart';
import 'package:pokemon_app/pages/move_detail_page.dart';
import 'package:pokemon_app/pages/pokemon_detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      routes: {
        HomePage.routeName: (_) => HomePage(),
        PokemonDetailPage.routeName: (_) => PokemonDetailPage(),
        MoveDetailPage.routeName: (_) => MoveDetailPage(),
        HeroTransitionPage.routeName: (_) => HeroTransitionPage(),
      },
    );
  }
}
