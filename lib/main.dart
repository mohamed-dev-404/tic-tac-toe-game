import 'package:flutter/material.dart';
import 'package:tix_tac_toe/constants/routes.dart';
import 'package:tix_tac_toe/screens/intro_screen.dart';

void main() {
  runApp(const TixTacToe());
}

class TixTacToe extends StatelessWidget {
  const TixTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: IntroScreen.routeName,
      routes: routes,
    );
  }
}
