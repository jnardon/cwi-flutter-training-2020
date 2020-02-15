import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:pokedex/constants/app-colors.dart';
import 'package:pokedex/ui/components/bottom-navigation/bottom-navigation.state.dart';
import 'package:pokedex/ui/pages/home/home.state.dart';

class AppBottomNavigation extends State<AppBottomNavigationState> {

  int currentIndex = 0;

  void navigateTo(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GradientBottomNavigationBar(
        backgroundColorStart: AppColors().mainBlue,
        backgroundColorEnd: AppColors().mainGreen,

        items: <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,

            icon: SvgPicture.asset(
              'assets/svg/pikachu.svg',
              width: 40,
              height: 40,
              color: this.currentIndex == 0 ?  Colors.black : Colors.grey,
            ),

            title: Text(
              "Pokemon",
              style: TextStyle(
                fontSize: 15,
                color: this.currentIndex == 0 ?  Colors.black : Colors.grey
              ),
            ),

          ),

          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,

            icon: SvgPicture.asset(
              'assets/svg/moves.svg',
              width: 40,
              height: 40,
              color: this.currentIndex == 1 ?  Colors.black : Colors.grey,
            ),

            title: Text(
              "Moves",
              style: TextStyle(
                fontSize: 15,
                color: this.currentIndex == 1 ?  Colors.black : Colors.grey
              ),
            ),

          ),

          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,

            icon: SvgPicture.asset(
              'assets/svg/items.svg',
              width: 40,
              height: 40,
              color: this.currentIndex == 2 ?  Colors.black : Colors.grey,
            ),

            title: Text(
              "Items",
              style: TextStyle(
                fontSize: 15,
                color: this.currentIndex == 2 ?  Colors.black : Colors.grey
              ),
            ),

          ),

        ],

        currentIndex: this.currentIndex,

        onTap: (index) {
          setState(() {
            this.currentIndex = index;

            switch (this.currentIndex) {
              case 0:
                this.navigateTo(HomeState());
                break;
              case 1:
                this.navigateTo(HomeState());
                break;
              case 2:
                this.navigateTo(HomeState());
                break;
            }
          });
        },
      )
    );
  }

}
