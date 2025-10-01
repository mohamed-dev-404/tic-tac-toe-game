import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tix_tac_toe/models/players_model.dart';
import 'package:tix_tac_toe/widgets/custom_board_button.dart';

class GameScreen extends StatefulWidget {
  static const String routeName = '/game';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late PlayersModel playersModel;

  int playerOneScore = 0;
  int playerTwoScore = 0;
  int turn = 0; // even for player 1 and odd for player 2
  String title = 'First Player Turn';
  List<String> gameBoard = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    playersModel = ModalRoute.of(context)!.settings.arguments as PlayersModel;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(42),
                    ),
                    child: Text(
                      'First Player(${playersModel.firstPlayerSign})  |  Second Player(${playersModel.secondPlayerSign}) \n      score: $playerOneScore       |       score: $playerTwoScore',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/boardBg.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                CustomBoardButton(
                                  gameBoard: gameBoard,
                                  index: 0,
                                  onClicked: onClicked,
                                ),
                                CustomBoardButton(
                                  gameBoard: gameBoard,
                                  index: 1,
                                  onClicked: onClicked,
                                ),
                                CustomBoardButton(
                                  gameBoard: gameBoard,
                                  index: 2,
                                  onClicked: onClicked,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                CustomBoardButton(
                                  gameBoard: gameBoard,
                                  index: 3,
                                  onClicked: onClicked,
                                ),
                                CustomBoardButton(
                                  gameBoard: gameBoard,
                                  index: 4,
                                  onClicked: onClicked,
                                ),
                                CustomBoardButton(
                                  gameBoard: gameBoard,
                                  index: 5,
                                  onClicked: onClicked,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                CustomBoardButton(
                                  gameBoard: gameBoard,
                                  index: 6,
                                  onClicked: onClicked,
                                ),
                                CustomBoardButton(
                                  gameBoard: gameBoard,
                                  index: 7,
                                  onClicked: onClicked,
                                ),
                                CustomBoardButton(
                                  gameBoard: gameBoard,
                                  index: 8,
                                  onClicked: onClicked,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

//! LOGIC SECTION

  void onClicked(int index) async {
    if (gameBoard[index].isNotEmpty) return; // if the cell is not empty

    if (turn % 2 == 0) {
      gameBoard[index] = playersModel.firstPlayerSign;
      title = 'Second Player Turn';
      turn++;
      if (checkIsWin(index, playersModel.firstPlayerSign)) {
        playerOneScore++;
        title = 'First Player Win  \n next round will start now ';
        setState(() {});
        await Future.delayed(const Duration(seconds: 5));
        clearBoard();
      }
    } else {
      gameBoard[index] = playersModel.secondPlayerSign;
      title = 'First Player Turn';
      turn++;
      if (checkIsWin(index, playersModel.secondPlayerSign)) {
        playerTwoScore++;
        title = 'Second Player Win  \n next round will start now ';
        setState(() {});
        await Future.delayed(const Duration(seconds: 5));
        clearBoard();
      }
    }

    if (turn == 9) {
      title = 'Draw \n next round will start now ';
      setState(() {});
      await Future.delayed(const Duration(seconds: 5));
      clearBoard();
    }

    setState(() {});
  }

  bool checkIsWin(int index, String sign) {
    //* check diagonals
    if (index.isEven) //then its on the diagonal and must check diagonals
    {
      if (gameBoard[0] == sign && gameBoard[4] == sign && gameBoard[8] == sign) {
        return true;
      }
      if (gameBoard[2] == sign && gameBoard[4] == sign && gameBoard[6] == sign) {
        return true;
      }
    }

    //* check columns
    int tepmCol1 = (index + 3) % 9;
    int tepmCol2 = (index + 6) % 9;
    //Now we idintify its column and can check it
    if (gameBoard[index] == sign &&
        gameBoard[tepmCol1] == sign &&
        gameBoard[tepmCol2] == sign) {
      return true;
    }

    //* check rows
    if (max(tepmCol2, max(tepmCol1, index)) ==
        index) // then its the last row and we will check it
    {
      if (gameBoard[6] == sign && gameBoard[7] == sign && gameBoard[8] == sign) {
        return true;
      }
    } else if (min(tepmCol2, min(tepmCol1, index)) == index)
    //then its the first row and we will check it
    {
      if (gameBoard[0] == sign && gameBoard[1] == sign && gameBoard[2] == sign) {
        return true;
      }
    } else //then its the middle row and we will check it
    {
      if (gameBoard[3] == sign && gameBoard[4] == sign && gameBoard[5] == sign) {
        return true;
      }
    }

    return false;
  }

  void clearBoard() {
    gameBoard = List.filled(9, '');
    turn = 0;
    title = 'First Player Turn';
    setState(() {});
  }
}
