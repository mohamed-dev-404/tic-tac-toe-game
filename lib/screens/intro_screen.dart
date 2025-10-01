import 'package:flutter/material.dart';
import 'package:tix_tac_toe/models/players_model.dart';
import 'package:tix_tac_toe/screens/game_screen.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = '/';
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/bg.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Image.asset(
                'assets/images/intro.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Spacer(
                flex: 2,
              ),
              Text(
                'Pick who goes first?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w500),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            GameScreen.routeName,
                            arguments: PlayersModel(
                                firstPlayerSign: 'x', secondPlayerSign: 'o'),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Image.asset('assets/images/x.png'),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            GameScreen.routeName,
                            arguments: PlayersModel(
                                firstPlayerSign: 'o', secondPlayerSign: 'x'),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Image.asset('assets/images/o.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          )),
    );
  }
}
