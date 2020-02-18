import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon_listing_model.dart';
import 'package:pokemon_app/pages/pokemon_detail_page.dart';
import 'package:pokemon_app/widgets/loader.dart';
import 'package:pokemon_app/widgets/main_app_bar.dart';
import 'package:pokemon_app/widgets/main_bottom_bar.dart';
import 'package:pokemon_app/widgets/pokemon_listing_card.dart';
import '../services/pokemon_service.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  final _pokemonService = PokemonService();

  List<PokemonListingModel> _pokemons;
  bool _isLoading = false;

  @override
  void initState() {
    _getPokemons();
    super.initState();
  }

  void _getPokemons() async {
    setState(() {
      _isLoading = true;
    });

    final pokemons = await _pokemonService.getPokemons();

    setState(() {
      _pokemons = pokemons;
      _isLoading = false;
    });
  }

  Widget _buildPokemonList() {
    return ListView.separated(
      itemBuilder: (_, i) {
        return PokemonListingCard(
          name: _pokemons[i].name,
          id: _pokemons[i].id,
          imageUrl: _pokemons[i].imageUrl,
          number: i + 1,
          types: _pokemons[i].types,
          onpressed: () {
            Navigator.of(context).pushNamed(
              PokemonDetailPage.routeName,
              arguments: {
                'id': _pokemons[i].id,
                'types': _pokemons[i].types,
              },
            );
          },
        );
      },
      separatorBuilder: (_, __) => Divider(),
      itemCount: _pokemons != null ? _pokemons.length : 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainBottomBar(),
      body: Column(
        children: <Widget>[
          MainAppBar(),
          Expanded(
              child: _isLoading
                  ? Center(
                      child: Loader(),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _buildPokemonList(),
                    )),
        ],
      ),
    );
  }
}
