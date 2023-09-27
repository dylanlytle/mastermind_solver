import 'package:flutter/material.dart';
import 'package:mastermind_solver/src/features/solver/domain/clue.dart';
import 'package:mastermind_solver/src/features/solver/domain/peg.dart';
import 'package:mastermind_solver/src/features/solver/domain/solution.dart';

class Guess {
  List<PegState> pegs = [
    PegState.notSelected,
    PegState.notSelected,
    PegState.notSelected,
    PegState.notSelected,
  ];
  Clue clue = Clue();

  Guess();

  void setClue(Clue clue) {
    this.clue = clue;
  }

  Clue getClue() {
    return clue;
  }

  Clue getClueFromSolution(Solution solution) {
    List<int> rightColorRightSpots = [];
    for (var guessPegIndex = 0; guessPegIndex < pegCount; guessPegIndex++) {
      if (pegs[guessPegIndex] == solution.pegs[guessPegIndex]) {
        rightColorRightSpots.add(guessPegIndex);
      }
    }
    int rightColorCount = 0;
    for (var guessPegIndex = 0; guessPegIndex < pegCount; guessPegIndex++) {
      for (var solutionPegIndex = 0; solutionPegIndex < pegCount; solutionPegIndex++) {
        // Don't check the spots that were already identified as right color and right spot
        if (!rightColorRightSpots.contains(guessPegIndex) && !rightColorRightSpots.contains(solutionPegIndex)) {
          if (pegs[guessPegIndex] == solution.pegs[solutionPegIndex]) {
            rightColorCount++;
            break;
          }
        }
      }
    }
    return Clue.fromCounts(rightColorRightSpots.length, rightColorCount);
  }

  void cycleGuessPeg(int pegIndex) {
    try {
      pegs[pegIndex] = PegState.values[pegs[pegIndex].index + 1];
    } on RangeError {
      pegs[pegIndex] = PegState.values[0];
    }
  }

  void cycleCluePeg(int pegIndex) {
    clue.cyclePeg(pegIndex);
  }

  Color? getColorForPeg(int pegIndex) {
    return pegColorMap[pegs[pegIndex]];
  }
}
