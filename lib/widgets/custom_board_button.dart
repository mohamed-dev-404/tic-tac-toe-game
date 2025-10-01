import 'package:flutter/material.dart';


class CustomBoardButton extends StatelessWidget {
  const CustomBoardButton({
    super.key,
    required this.gameBoard,
    required this.index,
    required this.onClicked,
  });

  final List<String> gameBoard;
  final int index;
  final Function onClicked;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
          ),
          onPressed: () {
            onClicked(index);
          },
          child: gameBoard[index].isEmpty
              ? const SizedBox(
                  height: double.infinity,
                )
              : Image.asset(
                  'assets/images/${gameBoard[index]}.png',
                  height: double.infinity,
                ),
        ),
      ),
    );
  }
}
