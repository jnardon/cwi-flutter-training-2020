import 'package:flutter/material.dart';
import 'package:pokemon_app/enums/types_etension.dart';
import 'package:pokemon_app/models/pokemon_listing_model.dart';
import 'package:pokemon_app/pages/pokemon_detail_page.dart';

class HeroTransitionPage extends StatefulWidget {
  static final routeName = '/transition';
  @override
  _HeroTransitionPageState createState() => _HeroTransitionPageState();
}

class _HeroTransitionPageState extends State<HeroTransitionPage> {
  bool _isInit = true;
  PokemonListingModel _pokemonListingModelFromRoute;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _getRouteInfo();

      Future.delayed(Duration(milliseconds: 400), () {
        Navigator.of(context)
            .popAndPushNamed(PokemonDetailPage.routeName, arguments: {
          'id': _pokemonListingModelFromRoute.id,
          'name': _pokemonListingModelFromRoute.name,
          'types': _pokemonListingModelFromRoute.types,
          'imageUrl': _pokemonListingModelFromRoute.imageUrl,
        });
      });
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  void _getRouteInfo() {
    final routeData = ModalRoute.of(context).settings.arguments
        as Map<String, PokemonListingModel>;
    setState(() {
      _pokemonListingModelFromRoute = routeData['model'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors =
        TypesExtension.parseToType(_pokemonListingModelFromRoute.types[0])
            .colors;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Center(
        child: Hero(
            tag: _pokemonListingModelFromRoute.id,
            child: Image.network(_pokemonListingModelFromRoute.imageUrl)),
      ),
    );
  }
}
