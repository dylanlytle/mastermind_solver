import 'package:flutter/material.dart';
import 'package:mastermind_solver/src/constants/colors.dart';
import 'package:mastermind_solver/src/features/solver/domain/clue.dart';

enum GuessState {
  notSelected,
  color1,
  color2,
  color3,
  color4,
  color5,
  color6,
}

class Guess {
  List<GuessState> states = [
    GuessState.notSelected,
    GuessState.notSelected,
    GuessState.notSelected,
    GuessState.notSelected,
  ];
  Clue clue = Clue();

  Map<GuessState, Color> guessColorMap = {
    GuessState.notSelected: grey,
    GuessState.color1: red,
    GuessState.color2: blue,
    GuessState.color3: green,
    GuessState.color4: white,
    GuessState.color5: black,
    GuessState.color6: yellow,
  };

  Guess(
      {this.states = const [
        GuessState.notSelected,
        GuessState.notSelected,
        GuessState.notSelected,
        GuessState.notSelected,
      ]});

  void setClue(Clue clue) {
    this.clue = clue;
  }

  Clue? getClue() {
    return clue;
  }

  Color? getColorForState(int stateIndex) {
    return guessColorMap[states[stateIndex]];
  }
}
