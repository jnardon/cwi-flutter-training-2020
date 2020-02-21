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
  bool _isAssetImage = false;
  String _idFromRoute;
  String _nameFromRoute;
  List<dynamic> _typesFromRoute;
  String _imageUrlFromRoute;
  String _urlToFromRoute;

  void _goToNextPage() {
    Future.delayed(Duration(milliseconds: 350), () {
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
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final colors = TypesExtension.parseToType(_typesFromRoute[0]).colors;
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
        child:
            Hero(tag: _idFromRoute, child: Image.network(_imageUrlFromRoute)),
      ),
    );
  }
}
