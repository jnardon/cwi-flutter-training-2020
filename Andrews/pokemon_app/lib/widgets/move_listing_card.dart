import 'package:flutter/material.dart';
import 'package:pokemon_app/enums/types.dart';
import 'package:pokemon_app/enums/types_etension.dart';

class MoveListingCard extends StatelessWidget {
  final String moveName;
  final TypesEnum type;
  final Function onpressed;

  MoveListingCard({
    @required this.moveName,
    @required this.type,
    @required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    String fileName = type.toString().toLowerCase();
    int index = fileName.indexOf('.');
    fileName = fileName.substring(index + 1);

    return GestureDetector(
      onTap: onpressed,
      child: ListTile(
        title: Text(this.moveName),
        trailing: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: this.type.colors,
                ),
                borderRadius: BorderRadius.circular(50)),
            child: ImageIcon(
              AssetImage('assets/images/$fileName.png'),
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
