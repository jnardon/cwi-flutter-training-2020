import 'package:flutter/material.dart';
import 'package:pokemon_app/helpers/string_helper.dart';
import 'package:pokemon_app/models/move_model.dart';
import 'package:pokemon_app/pages/hero_transition_page.dart';
import 'package:pokemon_app/pages/templates/app_scaffold.dart';
import 'package:pokemon_app/services/moves_service.dart';
import 'package:pokemon_app/widgets/loader.dart';
import 'package:pokemon_app/widgets/move_listing_card.dart';

class MovesListPage extends StatefulWidget {
  static final routeName = '/moves-list';
  @override
  _MovesListPageState createState() => _MovesListPageState();
}

class _MovesListPageState extends State<MovesListPage> {
  final movesService = MovesService();

  bool _isLoading;
  List<MoveModel> _moves;

  @override
  void initState() {
    _getMoves();
    super.initState();
  }

  void _getMoves() async {
    setState(() {
      _isLoading = true;
    });

    final moves = await movesService.getMoves();

    setState(() {
      _moves = moves;
      _isLoading = false;
    });
  }

  _buildMovesList() {
    return ListView.separated(
      itemBuilder: (_, i) {
        return MoveListingCard(
          moveName: StringHelper.setToDisplayPattern(_moves[i].name),
          type: _moves[i].type,
          onpressed: () {
            // Navigator.of(context).pushNamed(
            //   HeroTransitionPage.routeName,
            //   arguments: {
            //     'model': _pokemons[i],
            //   },
            // );
          },
        );
      },
      separatorBuilder: (_, __) => Divider(),
      itemCount: _moves != null ? _moves.length : 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentNavBarIndex: 1,
      child: Expanded(
        child: _isLoading
            ? Center(
                child: Loader(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _buildMovesList(),
              ),
      ),
    );
  }
}
