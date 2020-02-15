import 'package:flutter/widgets.dart';
import 'package:pokedex/ui/pages/details/details.dart';

class DetailsState extends StatefulWidget {

  final int pokemonId;

  DetailsState({
    @required this.pokemonId
  });

  @override
  State<StatefulWidget> createState() => Details(pokemonId: this.pokemonId);

}
