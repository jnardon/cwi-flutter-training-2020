import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/constants/app-colors.dart';

class Header extends StatelessWidget {

  String search;
  Function onChangeSearch;

  Header({
    @required this.search,
    @required this.onChangeSearch
  });

  @override
  Widget build(BuildContext context) {
    return (
      Column(
        children: <Widget>[
          Container(
            height: 160,

            padding: EdgeInsets.only(top: 50, right: 15, left: 15, bottom: 5),

            alignment: Alignment.center,

            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColors().mainBlue, AppColors().mainGreen]
              )
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[

                Text(
                  'Pokedex',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22
                  ),
                ),

                Container(
                  
                  margin: EdgeInsets.only(top: 15, bottom: 10),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                    color: Color.fromRGBO(196, 196, 196, 0.6)
                  ),

                  child: TextFormField(

                    onChanged: this.onChangeSearch,

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      
                      hintText: 'Search',
                      
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey[800],
                      ),

                      suffixIcon: Icon(
                        Icons.keyboard_voice,
                        color: Colors.grey[800],
                      )
                    ),

                  )
                )

              ],
            ),
          ),

          Container(
            height: 6,

            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColors().darkerBlue, AppColors().darkerGreen]
              )
            ),
          )
        ],
      )
    );
  }

}
