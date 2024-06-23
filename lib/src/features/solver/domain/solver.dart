import 'package:mastermind_solver/src/features/solver/domain/guess.dart';
import 'package:mastermind_solver/src/features/solver/domain/peg.dart';
import 'package:mastermind_solver/src/features/solver/domain/solution.dart';

class Solver {
  Solver({required this.guesses, required this.onlyOneOfEachColor});
  final List<Guess> guesses;
  final bool onlyOneOfEachColor;

  List<Solution> getSolutions() {
    List<Solution> solutions = [];
    for (var peg0 in PegState.values) {
      if (peg0 != PegState.notSelected) {
        for (var peg1 in PegState.values) {
          if (peg1 != PegState.notSelected) {
            for (var peg2 in PegState.values) {
              if (peg2 != PegState.notSelected) {
                for (var peg3 in PegState.values) {
                  if (peg3 != PegState.notSelected) {
                    Solution solution =
                        Solution(List<PegState>.of([peg0, peg1, peg2, peg3]));
                    bool validSolution = true;
                    if (onlyOneOfEachColor) {
                      if (peg0 == peg1 ||
                          peg0 == peg2 ||
                          peg0 == peg3 ||
                          peg1 == peg2 ||
                          peg1 == peg3 ||
                          peg2 == peg3) {
                        validSolution = false;
                      }
                    }
                    for (var guess in guesses) {
                      if (!guess
                          .getClue()
                          .equals(guess.getClueFromSolution(solution))) {
                        validSolution = false;
                      }
                    }
                    if (validSolution) {
                      solutions.add(solution);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    solutions.shuffle();
    return solutions;
  }

  void addGuess() {
    guesses.add(Guess());
  }

  void updateGuess(Guess guess, int index) {
    guesses[index] = guess;
  }

  void cycleGuessPeg(int guessIndex, int pegIndex) {
    guesses[guessIndex].cycleGuessPeg(pegIndex);
  }

  void cycleCluePeg(int guessIndex, int pegIndex) {
    guesses[guessIndex].cycleCluePeg(pegIndex);
  }

  bool getOnlyOneOfEachColor() {
    return onlyOneOfEachColor;
  }

  void addGuessPegs(Guess guess) {
    guesses.add(guess);
  }
}
