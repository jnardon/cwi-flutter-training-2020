import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokedex/constants/pokemon-colors.dart';
import 'package:pokedex/constants/pokemon-types.dart';

class ColorHelper {

  Color getColorByTypeString(String type) {
    return TypesExtension(EnumToString.fromString(List.from(TypesEnum.values), type)).color;
  }

}
