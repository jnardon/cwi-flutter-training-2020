import 'package:flutter/material.dart';
import 'package:pokemon_app/enums/types_etension.dart';
import 'package:pokemon_app/helpers/string_helper.dart';
import 'package:pokemon_app/models/pokemon_details_model.dart';
import 'package:pokemon_app/services/pokemon_service.dart';
import 'package:pokemon_app/widgets/loader.dart';
import 'package:pokemon_app/widgets/pokemon_stats_bar.dart';
import 'package:pokemon_app/widgets/pokemon_type_tag.dart';

class PokemonDetailPage extends StatefulWidget {
  static String routeName = '/details';
  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  final _pokemonService = PokemonService();

  bool _isInit = true;
  bool _isLoading = false;
  String _nameFromRoute;
  List _typesFromRoute;
  String _idFromRoute;
  String _imageUrlFromRoute;
  PokemonDetailModel _pokemonModel;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _getPokemonData();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _getPokemonData() async {
    final data =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    setState(() {
      _isLoading = true;
      _nameFromRoute = data['name'];
      _idFromRoute = data['id'];
      _typesFromRoute = data['types'];
      _imageUrlFromRoute = data['imageUrl'];
    });

    PokemonDetailModel pokemonModel =
        await _pokemonService.getPokemonDetails(_idFromRoute);

    setState(() {
      _pokemonModel = pokemonModel;
      _isLoading = false;
    });
  }

  Row _buildTypesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _typesFromRoute
          .map((type) => Padding(
                padding: const EdgeInsets.all(5),
                child: PokemonTypeTag(
                  typeName: type.toString(),
                  typeIcon: AssetImage('assets/images/$type.png'),
                  gradientColors: TypesExtension.parseToType(type).colors,
                ),
              ))
          .toList(),
    );
  }

  Widget _verticalSpacer({double height = 30}) {
    return SizedBox(
      height: height,
    );
  }

  Container _buildStats() {
    return Container(
      width: double.infinity,
      child: Column(
        children: _pokemonModel.stats
            .map((stat) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: PokemonStatsBar(
                    statsName: stat.name,
                    value: stat.value,
                    colors: TypesExtension.parseToType(_pokemonModel.types[0])
                        .colors,
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildDescriptionAndStats() {
    return _isLoading
        ? SizedBox(
            height: 200,
            child: Center(
              child: Loader(),
            ),
          )
        : Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Text(
                  _pokemonModel.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              _verticalSpacer(),
              Text(
                'STATS',
                style: TextStyle(
                    fontSize: 18,
                    color: TypesExtension.parseToType(_pokemonModel.types[0])
                        .colors[0]),
              ),
              _verticalSpacer(),
              _buildStats(),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: TypesExtension.parseToType(_typesFromRoute[0]).colors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                StringHelper.capitalizeFirstLetter(
                                    _nameFromRoute),
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w300),
                              ),
                              _verticalSpacer(),
                              _buildTypesRow(),
                              _verticalSpacer(),
                              _buildDescriptionAndStats(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -80,
                    child: Hero(
                      tag: _idFromRoute,
                      child: Image.network(
                        _imageUrlFromRoute,
                        height: 110,
                        width: 110,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
