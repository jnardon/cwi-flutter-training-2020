import 'package:flutter/material.dart';
import 'package:pokemon_app/widgets/main_app_bar.dart';
import 'package:pokemon_app/widgets/main_bottom_bar.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final int currentNavBarIndex;

  AppScaffold({
    this.child,
    this.currentNavBarIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainBottomBar(
          currentIndex:
              this.currentNavBarIndex != null ? this.currentNavBarIndex : 0),
      body: Column(
        children: <Widget>[
          MainAppBar(),
          this.child,
        ],
      ),
    );
  }
}
