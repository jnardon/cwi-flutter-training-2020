import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/constants/stats-formated.dart';
import 'package:pokedex/constants/stats.dart';

class StatsList extends StatelessWidget {

  final List stats;
  final Color color;

  StatsList({
    @required this.stats,
    @required this.color
  });

  String getStatFormated(String statParam) {
    int dashIndex = statParam.indexOf('-');

    String statString = statParam;

    if(dashIndex != -1) {
      statString = statString.replaceFirst('-', '');
    }

    StatsEnum stat = EnumToString.fromString(StatsEnum.values, statString);

    return StatsFormated(stat).stat;
  }

  String getStatValueFormated(String value) {
    return value.length == 2 ? '0$value' : '$value';
  }

  Widget renderStatItem(context, index) {
    final stat = this.stats[index];

    return (
      Container(
        margin: EdgeInsets.only(bottom: 15),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[

            Container(
              child: Text(
                this.getStatFormated(stat['name']),
                style: TextStyle(
                  color: this.color,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(right: 10),

              child: Text(
                this.getStatValueFormated(stat['value'].toString()),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18
                ),
              ),
            ),
        
            Container(
              width: 250.0,
              height: 12,
              alignment: Alignment.centerLeft,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.grey[200],
              ),

              child: Container(
                width: stat['value'] * 2.5,
                height: 12,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),

                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color.fromRGBO(this.color.red, this.color.green, this.color.blue, 0.4), this.color]
                  )
                ),

              ),
            ),

          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.stats.length,
      itemBuilder: this.renderStatItem
    );
  }

}
