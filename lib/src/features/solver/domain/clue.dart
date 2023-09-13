import 'package:flutter/material.dart';
import 'package:mastermind_solver/src/constants/colors.dart';

enum ClueState {
  wrong,
  rightColor,
  rightColorRightSpot,
}

class Clue {
  List<ClueState> states = [
    ClueState.wrong,
    ClueState.wrong,
    ClueState.wrong,
    ClueState.wrong,
  ];

  Map<ClueState, Color> clueColorMap = {
    ClueState.wrong: black,
    ClueState.rightColor: red,
    ClueState.rightColorRightSpot: white,
  };

  Clue(
      {this.states = const [
        ClueState.wrong,
        ClueState.wrong,
        ClueState.wrong,
        ClueState.wrong,
      ]});

  Color? getColorForState(int stateIndex) {
    return clueColorMap[states[stateIndex]];
  }
}
