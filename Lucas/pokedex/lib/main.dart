import 'package:flutter/material.dart';
import 'package:pokedex/constants/app-colors.dart';
import 'package:pokedex/ui/pages/home/home.state.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex App',
      home: this._introScreen(),
    );
  }

  Widget _introScreen() {
    return Stack(
      children: <Widget>[

        SplashScreen(
          seconds: 3,
          gradientBackground: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors().mainBlue,
              AppColors().mainGreen
            ],
          ),
          navigateAfterSeconds: HomeState(),
          loaderColor: Colors.transparent,
        ),

        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/pokeball.png"),
              fit: BoxFit.none,
            ),
          ),
        ),

      ],
    );
  }
  
}
