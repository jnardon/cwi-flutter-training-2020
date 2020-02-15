import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/constants/pokemon-colors.dart';
import 'package:pokedex/constants/pokemon-types.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/ui/components/pokemon-list/pokemon-list.state.dart';
import 'package:pokedex/ui/pages/details/splash/splash-details.dart';

class PokemonList extends State<PokemonListState> {

  final List<Pokemon> pokemonList;
  bool isGoingToDetails = false;

  PokemonList({
    @required this.pokemonList
  });

  String getPokemonNumber(int id,) {
    return id.toString().length == 1 ? '#00$id' : '#0$id';
  }

  String getPokemonCapitalizedName(String name) {
    return '${name[0].toUpperCase()}${name.substring(1)}';
  }

  Widget getPokemonTypes(List types) {
    if(types.length == 1) {
      return (
        Container(
          width: 45,
          height: 45,

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: EnumToString.fromString(TypesEnum.values, types[0]).color
          ),

          child: Image.asset(
            'assets/images/types/${types[0]}.png'
          )
        )
      );
    }

    return (
      Row(
        children: <Widget>[
          Container(
            width: 45,
            height: 45,

            margin: EdgeInsets.only(right: 15),

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: EnumToString.fromString(TypesEnum.values, types[0]).color
            ),

            child: Image.asset(
              'assets/images/types/${types[0]}.png'
            )
          ),

          Container(
            width: 45,
            height: 45,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: EnumToString.fromString(TypesEnum.values, types[1]).color
            ),

            child: Image.asset(
              'assets/images/types/${types[1]}.png'
            )
          )
        ],
      )
    );
  }

  void navigateToDetailsSplash(Pokemon pokemon) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsSplash(pokemon: pokemon,))
    );
  }

  Widget renderListItem(context, index) {
    return (
      FlatButton(
        onPressed: () => this.navigateToDetailsSplash(this.pokemonList[index]),

        child: Container(
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 5, right: 5),

          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.grey[300])
            )
          ),

          child: Row(
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(right: 15),

                child: Image.network(
                  this.pokemonList[index].imageUrl,
                  width: 60,
                  height: 60,
                ),
              ),
              
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  Text(
                    this.getPokemonCapitalizedName(this.pokemonList[index].name),

                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                    ),
                  ),

                  Text(
                    this.getPokemonNumber(this.pokemonList[index].id),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15
                    ),
                  )
                ],
              ),

              Spacer(),

              this.getPokemonTypes(this.pokemonList[index].types)

            ],
          ),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),

      child: ListView.builder(
        itemBuilder: this.renderListItem,
        itemCount: this.pokemonList.length,
      )
    );
  }

}
