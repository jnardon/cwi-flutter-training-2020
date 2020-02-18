import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:pokemon_app/enums/pokemon_stats.dart';
import 'package:pokemon_app/enums/pokemon_stats_extension.dart';

class PokemonStatsBar extends StatelessWidget {
  final PokemonStats statsName;
  final int value;
  final List<Color> colors;

  PokemonStatsBar({
    @required this.statsName,
    @required this.value,
    @required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: deviceSize.width * 0.15,
          child: Text(this.statsName.displayName,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: this.colors[0])),
        ),
        Container(
          width: deviceSize.width * 0.15,
          child: Text(this.value.toString(),
              style: TextStyle(
                fontSize: 16,
              )),
        ),
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[300],
              value: this.value.toDouble() / 100.0,
              valueColor: AlwaysStoppedAnimation<Color>(this.colors[0]),
            ),
          ),
        )
      ],
    );
  }
}
