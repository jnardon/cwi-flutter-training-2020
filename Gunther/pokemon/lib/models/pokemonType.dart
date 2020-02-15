import 'dart:ui';

enum PokemonType { grass, poison, fire, flying, water, bug, normal, electric }

extension PokemonTypeExtension on PokemonType {
  String get imagePath {
    String typeName;
    switch (this) {
      case PokemonType.grass:
        typeName = 'grass';
        break;
      case PokemonType.poison:
        typeName = 'poison';
        break;
      case PokemonType.fire:
        typeName = 'fire';
        break;
      case PokemonType.flying:
        typeName = 'flying';
        break;
      case PokemonType.water:
        typeName = 'water';
        break;
      case PokemonType.bug:
        typeName = 'bug';
        break;
      case PokemonType.normal:
        typeName = 'normal';
        break;
      case PokemonType.electric:
        typeName = 'electric';
        break;
    }
    return 'assets/images/types/ic_$typeName.png';
  }

  Color get color {
    switch (this) {
      case PokemonType.grass:
        return Color.fromRGBO(95, 188, 81, 1);
      case PokemonType.poison:
        return Color.fromRGBO(168, 100, 199, 1);
      case PokemonType.fire:
        return Color.fromRGBO(251, 155, 81, 1);
      case PokemonType.flying:
        return Color.fromRGBO(144, 167, 218, 1);
      case PokemonType.water:
        return Color.fromRGBO(74, 144, 221, 1);
      case PokemonType.bug:
        return Color.fromRGBO(146, 188, 44, 1);
      case PokemonType.normal:
        return Color.fromRGBO(146, 152, 164, 1);
      case PokemonType.electric:
        return Color.fromRGBO(237, 213, 62, 1);
      default:
        return null;
    }
  }
}
