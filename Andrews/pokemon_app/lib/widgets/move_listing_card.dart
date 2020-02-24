import 'package:flutter/material.dart';
import 'package:pokemon_app/enums/types.dart';
import 'package:pokemon_app/enums/types_etension.dart';

class MoveListingCard extends StatelessWidget {
  final String moveName;
  final TypesEnum type;
  final String id;
  final Function onpressed;

  MoveListingCard({
    @required this.moveName,
    @required this.id,
    @required this.type,
    @required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: ListTile(
        title: Text(this.moveName),
        trailing: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: this.type.colors,
                ),
                borderRadius: BorderRadius.circular(50)),
            child: Hero(
              tag: this.id,
              child: ImageIcon(
                AssetImage('assets/images/${type.name}.png'),
                color: Colors.white,
                size: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
