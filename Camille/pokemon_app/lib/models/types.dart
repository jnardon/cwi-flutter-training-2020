import 'dart:ui';

enum Types { fire, grass, poison, flying, water, bug, normal, electric }

extension TypesExtension on Types {
  Color get color {
    switch (this) {
      case Types.fire:
        return Color.fromRGBO(251, 155, 81, 1);
      case Types.grass:
        return Color.fromRGBO(95, 188, 81, 1);
      case Types.poison:
        return Color.fromRGBO(168, 100, 199, 1);
      case Types.flying:
        return Color.fromRGBO(144, 167, 218, 1);
      case Types.water:
        return Color.fromRGBO(74, 144, 221, 1);
      case Types.bug:
        return Color.fromRGBO(146, 188, 44, 1);
      case Types.normal:
        return Color.fromRGBO(146, 152, 164, 1);
      case Types.electric:
        return Color.fromRGBO(237, 213, 62, 1);
      default:
        return null;
    }
  }

  String get icon {
    switch (this) {
      case Types.fire:
        return "assets/icons/fire.png";
      case Types.grass:
        return "assets/icons/grass.png";
      case Types.poison:
        return "assets/icons/poison.png";
      case Types.flying:
        return "assets/icons/flying.png";
      case Types.water:
        return "assets/icons/water.png";
      case Types.bug:
        return "assets/icons/bug.png";
      case Types.normal:
        return "assets/icons/normal.png";
      case Types.electric:
        return "assets/icons/electric.png";
      default:
        return null;
    }
  }

  String get name {
    switch (this) {
      case Types.fire:
        return "fire";
      case Types.grass:
        return "grass";
      case Types.poison:
        return "poison";
      case Types.flying:
        return "flying";
      case Types.water:
        return "water";
      case Types.bug:
        return "bug";
      case Types.normal:
        return "normal";
      case Types.electric:
        return "electric";
      default:
        return null;
    }
  }
}


