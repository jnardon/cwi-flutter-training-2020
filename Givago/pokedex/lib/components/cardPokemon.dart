import 'package:flutter/material.dart';
import 'package:pokedex/components/cardType.dart';

class CardPokemon extends StatefulWidget {
  String name, id, image;
  List<dynamic> types;

  CardPokemon({this.name, this.id, this.image, this.types})
      : assert(name != null && id != null && image != null && types != null);

  @override
  _CardPokemonState createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => Navigator.pushNamed(
        context,
        '/pokemonPage',
        arguments: {'id': widget.id, 'imageUrl': widget.image},
      ),
      child: Container(
        color: Colors.white,
        height: 75,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: Hero(
                  tag: widget.id,
                  child: Image.network(widget.image),
                ),
                height: 45,
                width: 45,
              ),
              SizedBox(width: 13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: 19),
                  ),
                  Text(
                    '#${widget.id}',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: widget.types
                    .map(
                      (type) => CardType(pokemonType: type.toString()),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
