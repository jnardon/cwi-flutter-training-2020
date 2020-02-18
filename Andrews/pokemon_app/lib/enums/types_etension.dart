import './types.dart';
import 'package:flutter/material.dart';

extension TypesExtension on TypesEnum {
  static TypesEnum parseToType(String type) {
    switch (type) {
      case 'fire':
        return TypesEnum.fire;
      case 'grass':
        return TypesEnum.grass;
      case 'poison':
        return TypesEnum.poison;
      case 'flying':
        return TypesEnum.flying;
      case 'water':
        return TypesEnum.water;
      case 'bug':
        return TypesEnum.bug;
      case 'normal':
        return TypesEnum.normal;
      case 'electric':
        return TypesEnum.electric;
      default:
        return null;
    }
  }

  List<Color> get colors {
    switch (this) {
      case TypesEnum.fire:
        return [
          Color.fromRGBO(251, 155, 81, 1),
          Color.fromRGBO(251, 174, 70, 1),
        ];
      case TypesEnum.grass:
        return [
          Color.fromRGBO(95, 188, 81, 1),
          Color.fromRGBO(90, 193, 120, 1),
        ];
      case TypesEnum.poison:
        return [
          Color.fromRGBO(168, 100, 199, 1),
          Color.fromRGBO(194, 97, 212, 1),
        ];
      case TypesEnum.flying:
        return [
          Color.fromRGBO(144, 167, 218, 1),
          Color.fromRGBO(166, 194, 242, 1),
        ];
      case TypesEnum.water:
        return [
          Color.fromRGBO(74, 144, 221, 1),
          Color.fromRGBO(108, 189, 228, 1),
        ];
      case TypesEnum.bug:
        return [
          Color.fromRGBO(146, 188, 44, 1),
          Color.fromRGBO(175, 200, 54, 1),
        ];
      case TypesEnum.normal:
        return [
          Color.fromRGBO(146, 152, 164, 1),
          Color.fromRGBO(163, 164, 158, 1),
        ];
      case TypesEnum.electric:
        return [
          Color.fromRGBO(237, 213, 62, 1),
          Color.fromRGBO(251, 226, 15, 1),
        ];
      default:
        return null;
    }
  }
}
