import './pokemon_stats.dart';

extension PokemonStatsExtension on PokemonStats {
  String get displayName {
    switch (this) {
      case PokemonStats.ATTACK:
        return 'ATK';
      case PokemonStats.DEFENSE:
        return 'DEF';
      case PokemonStats.HP:
        return 'HP';
      case PokemonStats.SPECIAL_ATTACK:
        return 'SATK';
      case PokemonStats.SPECIAL_DEFENSE:
        return 'SDEF';
      case PokemonStats.SPEED:
        return 'SPD';
    }
    return null;
  }

  static PokemonStats parseToStats(String stats) {
    switch (stats) {
      case 'hp':
        return PokemonStats.HP;
      case 'attack':
        return PokemonStats.ATTACK;
      case 'defense':
        return PokemonStats.DEFENSE;
      case 'special-attack':
        return PokemonStats.SPECIAL_ATTACK;
      case 'special-defense':
        return PokemonStats.SPECIAL_DEFENSE;
      case 'speed':
        return PokemonStats.SPEED;
    }
    return null;
  }
}
