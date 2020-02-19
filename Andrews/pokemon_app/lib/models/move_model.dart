import 'package:flutter/cupertino.dart';
import 'package:pokemon_app/enums/types.dart';

class MoveModel {
  final String name;
  final int learnLevel;
  final TypesEnum type;

  MoveModel({
    @required this.name,
    @required this.learnLevel,
    @required this.type,
  });
}
