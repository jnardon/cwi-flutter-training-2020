import 'package:flutter/material.dart';
import 'package:pokemon_app/pages/hero_transition_page.dart';
import 'package:pokemon_app/pages/home.dart';
import 'package:pokemon_app/pages/moves_list_page.dart';
import 'package:pokemon_app/pages/pokemon_detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      routes: {
        HomePage.routeName: (_) => HomePage(),
        PokemonDetailPage.routeName: (_) => PokemonDetailPage(),
        HeroTransitionPage.routeName: (_) => HeroTransitionPage(),
        MovesListPage.routeName: (_) => MovesListPage(),
      },
    );
  }
}
