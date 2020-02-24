import 'package:flutter/material.dart';
import 'package:pokemon_app/enums/listing_options.dart';
import 'package:pokemon_app/enums/types_etension.dart';
import 'package:pokemon_app/helpers/route_helper.dart';

class HeroTransitionPage extends StatefulWidget {
  static final routeName = '/transition';

  @override
  _HeroTransitionPageState createState() => _HeroTransitionPageState();
}

class _HeroTransitionPageState extends State<HeroTransitionPage> {
  bool _isInit = true;
  String _idFromRoute;
  String _nameFromRoute;
  List<dynamic> _typesFromRoute;
  String _imageUrlFromRoute;
  String _urlToFromRoute;
  ListingOptions _listingOptionFromRoute;

  void _goToNextPage() {
    Future.delayed(RouteHelper.transitionDuration, () {
      Navigator.of(context).pushReplacementNamed(_urlToFromRoute, arguments: {
        'id': _idFromRoute,
        'name': _nameFromRoute,
        'types': _typesFromRoute,
        'imageUrl': _imageUrlFromRoute,
      });
    });
  }

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      await _getRouteInfo();
      _goToNextPage();
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _getRouteInfo() {
    final routeData =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    setState(() {
      _idFromRoute = routeData['id'];
      _nameFromRoute = routeData['name'];
      _typesFromRoute = routeData['types'];
      _imageUrlFromRoute = routeData['imageUrl'];
      _urlToFromRoute = routeData['urlTo'];
      _listingOptionFromRoute = routeData['listingOption'];
    });

    return null;
  }

  Widget _buildImage() {
    switch (this._listingOptionFromRoute) {
      case ListingOptions.POKEMONS:
        return Image.network(
          _imageUrlFromRoute,
          height: double.infinity,
          width: double.infinity,
        );
      case ListingOptions.MOVES:
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: TypesExtension.parseToType(_typesFromRoute[0]).colors,
              ),
              borderRadius: BorderRadius.circular(50)),
          child: Image.asset(
            _imageUrlFromRoute,
            height: double.infinity,
            width: double.infinity,
          ),
        );
      case ListingOptions.ITEMS:
        return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final colors = TypesExtension.parseToType(_typesFromRoute[0]).colors;
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Center(
        child: Hero(
          tag: _idFromRoute,
          child: _buildImage(),
        ),
      ),
    );
  }
}
