import 'package:flutter/material.dart';
import 'package:mastermind_solver/src/constants/colors.dart';
import 'package:mastermind_solver/src/features/solver/domain/peg.dart';

enum ClueState {
  wrong,
  rightColor,
  rightColorRightSpot,
}

class Clue {
  List<ClueState> clues = [
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

  Clue();

  Clue.fromCounts(int rightColorRightSpotCount, int rightColorCount){
    int clueIndex = 0;
    for (var i = 0; i < rightColorRightSpotCount; i++) {
      clues[clueIndex++] = ClueState.rightColorRightSpot;
    }
    for (var i = 0; i < rightColorCount; i++) {
      clues[clueIndex++] = ClueState.rightColor;
    }
  }

  bool equals(Clue clue) {
    return ((getRightColorRightSpotCount() == clue.getRightColorRightSpotCount()) &&
            (getRightColorCount()          == clue.getRightColorCount()));
  }

  int getRightColorRightSpotCount() {
    int rightColorRightSpotCount = 0;
    for (var i = 0; i < pegCount; i++) {
      if (clues[i] == ClueState.rightColorRightSpot) {
        rightColorRightSpotCount++;
      }
    }
    return rightColorRightSpotCount;
  }

  int getRightColorCount() {
    int rightColorRightSpotCount = 0;
    for (var i = 0; i < pegCount; i++) {
      if (clues[i] == ClueState.rightColorRightSpot) {
        rightColorRightSpotCount++;
      }
    }
    return rightColorRightSpotCount;
  }

  void cyclePeg(int clueIndex) {
    try {
      clues[clueIndex] = ClueState.values[clues[clueIndex].index + 1];
    } on RangeError {
      clues[clueIndex] = ClueState.values[0];
    }
  }

  Color? getColorForPeg(int pegIndex) {
    return clueColorMap[clues[pegIndex]];
  }
}
