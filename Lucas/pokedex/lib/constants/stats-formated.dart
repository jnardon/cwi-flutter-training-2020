import 'package:pokedex/constants/stats.dart';

extension StatsFormated on StatsEnum {

  String get stat {

    switch (this) {
      case StatsEnum.attack:
        return 'ATK';

      case StatsEnum.defense:
        return 'DEF';

      case StatsEnum.hp:
        return 'HP';

      case StatsEnum.speed:
        return 'SPD';

      case StatsEnum.specialattack:
        return 'SATK';

      case StatsEnum.specialdefense:
        return 'SDEF';
        
      default:
        return null;
    }

  }

}
