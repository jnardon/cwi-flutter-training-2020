import 'package:flutter/material.dart';
import 'package:pokemon_app/components/type.dart';
import 'package:pokemon_app/models/types.dart';

class PokemonCard extends StatelessWidget {
  String imageUrl;
  String name;
  String id;
  List<Types> types;
  Function onTap;

  PokemonCard(
      {@required this.imageUrl,
      @required this.name,
      @required this.id,
      this.types,
      this.onTap});

  Widget _renderType(Types item) {
    return Type(
      color: item.color,
      icon: item.icon,
    );
  }

  Widget _renderTypes() {
    return new Row(children: types.map((item) => _renderType(item)).toList());
  }

  String _getId() {
    if (int.parse(id) < 10) return "#00$id";
    return "#0$id";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {onTap();},
      highlightColor: types[0].color,
      splashColor: types[0].color,
      child: Container(
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(227, 227, 227, 1)))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 0, 15),
          child: Row(
            children: <Widget>[
              Hero(
                tag: id,
                child: Image.network(imageUrl),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    Text(
                      _getId(),
                      style: TextStyle(
                          color: Color.fromRGBO(164, 164, 164, 1),
                          fontSize: 15),
                    )
                  ],
                ),
              ),
              Spacer(),
              _renderTypes(),
            ],
          ),
        ),
      ),
    );
  }
}
