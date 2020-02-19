import 'package:flutter/material.dart';
import 'package:pokemon_app/pages/home.dart';
import 'package:pokemon_app/pages/moves_list_page.dart';

class MainBottomBar extends StatelessWidget {
  final int currentIndex;

  MainBottomBar({
    @required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(110, 149, 253, 1),
        Color.fromRGBO(111, 222, 250, 1),
        Color.fromRGBO(141, 244, 97, 1),
        Color.fromRGBO(81, 232, 94, 1),
      ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
      child: Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: Color.fromRGBO(255, 255, 255, 0.3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).popAndPushNamed(HomePage.routeName);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ImageIcon(
                    AssetImage('assets/images/pokemons_icon.png'),
                    size: 23,
                    color: this.currentIndex == 0
                        ? Colors.black
                        : Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                  Text('Pokemon'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).popAndPushNamed(MovesListPage.routeName);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ImageIcon(
                    AssetImage(this.currentIndex == 1
                        ? 'assets/images/pokeball_icon_solid.png'
                        : 'assets/images/pokeball_icon_transparent.png'),
                    size: 23,
                  ),
                  Text('Moves'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ImageIcon(
                    AssetImage(this.currentIndex == 2
                        ? 'assets/images/items_icon_solid.png'
                        : 'assets/images/items_icon_transparent.png'),
                    size: 23,
                  ),
                  Text('Items'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
