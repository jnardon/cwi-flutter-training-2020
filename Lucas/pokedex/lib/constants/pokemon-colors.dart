import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/pokemon-types.dart';

extension TypesExtension on TypesEnum {

  Color get color {

    switch (this) {
      case TypesEnum.fire:
        return Color.fromRGBO(251, 155, 81, 1);

      case TypesEnum.grass:
        return Colors.green;

      case TypesEnum.poison:
        return Colors.purple;

      case TypesEnum.flying:
        return Colors.blue[100];

      case TypesEnum.water:
        return Colors.blue;

      case TypesEnum.bug:
        return Colors.green[300];

      case TypesEnum.normal:
        return Colors.grey;

      case TypesEnum.electric:
        return Colors.yellow;
        
      default:
        return null;
    }

  }

}
