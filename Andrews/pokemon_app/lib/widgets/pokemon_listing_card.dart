import 'package:flutter/material.dart';
import 'package:pokemon_app/enums/types_etension.dart';

class PokemonListingCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String id;
  final int number;
  final List types;
  final Function onpressed;

  PokemonListingCard({
    @required this.name,
    @required this.id,
    @required this.imageUrl,
    @required this.number,
    @required this.types,
    @required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: ListTile(
        leading: Container(
          width: 50,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Image.network(this.imageUrl),
        ),
        title: Text(this.name),
        subtitle: Text(this.number.toString()),
        trailing: Container(
          width: 104,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: this
                .types
                .map(
                  (type) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: TypesExtension.parseToType(type).colors),
                          borderRadius: BorderRadius.circular(50)),
                      child: ImageIcon(
                        AssetImage('assets/images/$type.png'),
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
