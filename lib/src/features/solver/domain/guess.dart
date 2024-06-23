import 'package:flutter/material.dart';
import 'package:mastermind_solver/src/features/solver/domain/clue.dart';
import 'package:mastermind_solver/src/features/solver/domain/peg.dart';
import 'package:mastermind_solver/src/features/solver/domain/solution.dart';

class Guess {
  List<PegState> _pegs = [
    PegState.notSelected,
    PegState.notSelected,
    PegState.notSelected,
    PegState.notSelected,
  ];
  Clue clue = Clue();

  Guess();

  Guess.guessFromPegs(List<PegState> pegs) {
    _pegs = pegs;
  }

  void setClue(Clue clue) {
    this.clue = clue;
  }

  Clue getClue() {
    return clue;
  }

  Clue getClueFromSolution(Solution solution) {
    List<int> rightColorRightSpots = [];
    for (var guessPegIndex = 0; guessPegIndex < pegCount; guessPegIndex++) {
      if (_pegs[guessPegIndex] == solution.pegs[guessPegIndex]) {
        rightColorRightSpots.add(guessPegIndex);
      }
    }
    int rightColorCount = 0;
    for (var guessPegIndex = 0; guessPegIndex < pegCount; guessPegIndex++) {
      for (var solutionPegIndex = 0;
          solutionPegIndex < pegCount;
          solutionPegIndex++) {
        // Don't check the spots that were already identified as right color and right spot
        if (!rightColorRightSpots.contains(guessPegIndex) &&
            !rightColorRightSpots.contains(solutionPegIndex)) {
          if (_pegs[guessPegIndex] == solution.pegs[solutionPegIndex]) {
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
      _pegs[pegIndex] = PegState.values[_pegs[pegIndex].index + 1];
    } on RangeError {
      _pegs[pegIndex] = PegState.values[0];
    }
  }

  void cycleCluePeg(int pegIndex) {
    clue.cyclePeg(pegIndex);
  }

  Color? getColorForPeg(int pegIndex) {
    return pegColorMap[_pegs[pegIndex]];
  }
}
