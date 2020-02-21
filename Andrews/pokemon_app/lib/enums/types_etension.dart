import './types.dart';
import 'package:flutter/material.dart';

extension TypesExtension on TypesEnum {
  static TypesEnum parseToType(String type) {
    switch (type) {
      case 'fire':
        return TypesEnum.FIRE;
      case 'grass':
        return TypesEnum.GRASS;
      case 'poison':
        return TypesEnum.POISON;
      case 'flying':
        return TypesEnum.FLYING;
      case 'water':
        return TypesEnum.WATER;
      case 'bug':
        return TypesEnum.BUG;
      case 'normal':
        return TypesEnum.NORMAL;
      case 'electric':
        return TypesEnum.ELECTRIC;
      case 'dark':
        return TypesEnum.DARK;
      default:
        return null;
    }
  }

  String get name {
    final index = this.toString().indexOf('.');
    return this.toString().substring(index + 1).toLowerCase();
  }

  List<Color> get colors {
    switch (this) {
      case TypesEnum.FIRE:
        return [
          Color.fromRGBO(251, 155, 81, 1),
          Color.fromRGBO(251, 174, 70, 1),
        ];
      case TypesEnum.GRASS:
        return [
          Color.fromRGBO(95, 188, 81, 1),
          Color.fromRGBO(90, 193, 120, 1),
        ];
      case TypesEnum.POISON:
        return [
          Color.fromRGBO(168, 100, 199, 1),
          Color.fromRGBO(194, 97, 212, 1),
        ];
      case TypesEnum.FLYING:
        return [
          Color.fromRGBO(144, 167, 218, 1),
          Color.fromRGBO(166, 194, 242, 1),
        ];
      case TypesEnum.WATER:
        return [
          Color.fromRGBO(74, 144, 221, 1),
          Color.fromRGBO(108, 189, 228, 1),
        ];
      case TypesEnum.BUG:
        return [
          Color.fromRGBO(146, 188, 44, 1),
          Color.fromRGBO(175, 200, 54, 1),
        ];
      case TypesEnum.NORMAL:
        return [
          Color.fromRGBO(146, 152, 164, 1),
          Color.fromRGBO(163, 164, 158, 1),
        ];
      case TypesEnum.ELECTRIC:
        return [
          Color.fromRGBO(237, 213, 62, 1),
          Color.fromRGBO(251, 226, 15, 1),
        ];
      case TypesEnum.DARK:
        return [
          Color.fromRGBO(89, 87, 97, 1),
          Color.fromRGBO(110, 117, 135, 1),
        ];
      default:
        return null;
    }
  }
}
