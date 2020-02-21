import 'package:flutter/material.dart';
import 'package:pokedex/components/cardType.dart';

class CardMove extends StatefulWidget {
  String name, type;
  int learnLevel;

  CardMove({this.name, this.type, this.learnLevel})
      : assert(name != null && type != null && learnLevel != null);

  @override
  _CardMoveState createState() => _CardMoveState();
}

class _CardMoveState extends State<CardMove> {
  String getName(String name) {
    String newName = name.replaceAll("-", " ");
    ;
    return newName;
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Container(
        color: Colors.white,
        height: 75,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 13),
              Text(
                getName(widget.name),
                style: TextStyle(fontSize: 19),
              ),
              Spacer(),
              CardType(pokemonType: widget.type.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
