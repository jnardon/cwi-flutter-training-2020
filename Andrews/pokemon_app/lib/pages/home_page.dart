import 'package:flutter/material.dart';
import 'package:pokemon_app/enums/types_etension.dart';
import 'package:pokemon_app/helpers/route_helper.dart';
import 'package:pokemon_app/helpers/string_helper.dart';
import 'package:pokemon_app/models/move_model.dart';
import 'package:pokemon_app/models/pokemon_listing_model.dart';
import 'package:pokemon_app/pages/hero_transition_page.dart';
import 'package:pokemon_app/pages/move_detail_page.dart';
import 'package:pokemon_app/pages/pokemon_detail_page.dart';
import 'package:pokemon_app/services/moves_service.dart';
import 'package:pokemon_app/widgets/loader.dart';
import 'package:pokemon_app/widgets/main_app_bar.dart';
import 'package:pokemon_app/widgets/main_bottom_bar.dart';
import 'package:pokemon_app/widgets/move_listing_card.dart';
import 'package:pokemon_app/widgets/pokemon_listing_card.dart';
import '../services/pokemon_service.dart';
import '../enums/listing_options.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  final _pokemonService = PokemonService();
  final movesService = MovesService();

  List<PokemonListingModel> _pokemons;
  List<MoveModel> _moves;
  ListingOptions listingOption = ListingOptions.POKEMONS;
  bool _isLoading = false;

  @override
  void initState() {
    _getPokemons();
    super.initState();
  }

  Future<void> _getMoves() async {
    setState(() {
      _isLoading = true;
    });

    final moves = await movesService.getMoves();

    setState(() {
      _moves = moves;
      _isLoading = false;
    });
  }

  Future<void> _getPokemons() async {
    setState(() {
      _isLoading = true;
    });

    final pokemons = await _pokemonService.getPokemons();

    setState(() {
      _pokemons = pokemons;
      _isLoading = false;
    });
  }

  void goToCustomTransition(Widget pageTo, {RouteSettings settings}) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: RouteHelper.transitionDuration,
        pageBuilder: (_, __, ___) => pageTo,
        settings: settings,
      ),
    );
  }

  Widget _buildMovesList() {
    return ListView.separated(
      itemBuilder: (_, i) {
        final moveId = '${_moves[i].name}$i';
        return MoveListingCard(
          moveName: StringHelper.setToDisplayPattern(_moves[i].name),
          type: _moves[i].type,
          id: moveId,
          onpressed: () {
            Navigator.of(context).pushNamed(
              HeroTransitionPage.routeName,
              arguments: {
                'id': moveId,
                'name': _moves[i].name,
                'types': [_moves[i].type.name],
                'imageUrl': 'assets/images/${_moves[i].type.name}.png',
                'listingOption': this.listingOption,
                'urlTo': MoveDetailPage.routeName,
              },
            );
          },
        );
      },
      separatorBuilder: (_, __) => Divider(),
      itemCount: _moves != null ? _moves.length : 0,
    );
  }

  Widget _buildPokemonList() {
    return ListView.separated(
      itemBuilder: (_, i) {
        return PokemonListingCard(
          name: StringHelper.setToDisplayPattern(_pokemons[i].name),
          id: _pokemons[i].id,
          imageUrl: _pokemons[i].imageUrl,
          number: i + 1,
          types: _pokemons[i].types,
          onpressed: () {
            goToCustomTransition(
              HeroTransitionPage(),
              settings: RouteSettings(arguments: {
                'id': _pokemons[i].id,
                'name': _pokemons[i].name,
                'types': _pokemons[i].types,
                'imageUrl': _pokemons[i].imageUrl,
                'listingOption': this.listingOption,
                'urlTo': PokemonDetailPage.routeName,
              }),
            );
          },
        );
      },
      separatorBuilder: (_, __) => Divider(),
      itemCount: _pokemons != null ? _pokemons.length : 0,
    );
  }

  Widget _buildList() {
    switch (this.listingOption) {
      case ListingOptions.POKEMONS:
        return RefreshIndicator(
          onRefresh: _getPokemons,
          child: this._buildPokemonList(),
        );
      case ListingOptions.MOVES:
        return RefreshIndicator(
          onRefresh: _getMoves,
          child: this._buildMovesList(),
        );
      case ListingOptions.ITEMS:
        return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainBottomBar(
        items: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                listingOption = ListingOptions.POKEMONS;
                _getPokemons();
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageIcon(
                  AssetImage('assets/images/pokemons_icon.png'),
                  size: 23,
                  color: this.listingOption == ListingOptions.POKEMONS
                      ? Colors.black
                      : Color.fromRGBO(0, 0, 0, 0.3),
                ),
                Text('Pokemon'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                listingOption = ListingOptions.MOVES;
                _getMoves();
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageIcon(
                  AssetImage(this.listingOption == ListingOptions.MOVES
                      ? 'assets/images/pokeball_icon_solid.png'
                      : 'assets/images/pokeball_icon_transparent.png'),
                  size: 23,
                ),
                Text('Moves'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageIcon(
                  AssetImage(this.listingOption == ListingOptions.ITEMS
                      ? 'assets/images/items_icon_solid.png'
                      : 'assets/images/items_icon_transparent.png'),
                  size: 23,
                ),
                Text('Items'),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          MainAppBar(),
          _isLoading
              ? Expanded(
                  child: Center(
                    child: Loader(),
                  ),
                )
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: _buildList(),
                  ),
                ),
        ],
      ),
    );
  }
}
