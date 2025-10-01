import 'package:flutter/material.dart';
import 'package:tix_tac_toe/screens/game_screen.dart';
import 'package:tix_tac_toe/screens/intro_screen.dart';

Map <String , WidgetBuilder> routes = {
  IntroScreen.routeName: (context) => const IntroScreen(),
  GameScreen.routeName: (context) => const GameScreen(),
};