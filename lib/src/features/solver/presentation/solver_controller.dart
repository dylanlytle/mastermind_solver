import 'package:mastermind_solver/src/features/solver/domain/guess.dart';
import 'package:mastermind_solver/src/features/solver/domain/solver.dart';
import 'package:mastermind_solver/src/features/solver/presentation/solver_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'solver_controller.g.dart';

@riverpod
class SolverController extends _$SolverController {
  SolverController();

  void cycleGuessPeg(int guessIndex, int pegIndex) {
    List<Guess> guesses = [...state.solver!.guesses];
    bool onlyOneOfEachColor = state.solver!.onlyOneOfEachColor;
    Solver solver =
        Solver(guesses: guesses, onlyOneOfEachColor: onlyOneOfEachColor);
    solver.cycleGuessPeg(guessIndex, pegIndex);
    state = state.copyWith(solver: solver);
  }

  void cycleCluePeg(int guessIndex, int pegIndex) async {
    List<Guess> guesses = [...state.solver!.guesses];
    bool onlyOneOfEachColor = state.solver!.onlyOneOfEachColor;
    Solver solver =
        Solver(guesses: guesses, onlyOneOfEachColor: onlyOneOfEachColor);
    solver.cycleCluePeg(guessIndex, pegIndex);
    state = state.copyWith(solver: solver);
  }

  void addGuess() {
    List<Guess> guesses = [...state.solver!.guesses];
    bool onlyOneOfEachColor = state.solver!.onlyOneOfEachColor;
    guesses.add(Guess());
    state = state.copyWith(
        solver:
            Solver(guesses: guesses, onlyOneOfEachColor: onlyOneOfEachColor));
  }

  void addGuessPegs(Guess guess) {
    List<Guess> guesses = [...state.solver!.guesses];
    bool onlyOneOfEachColor = state.solver!.onlyOneOfEachColor;
    guesses.add(guess);
    state = state.copyWith(
        solver:
            Solver(guesses: guesses, onlyOneOfEachColor: onlyOneOfEachColor));
  }

  void removeGuess(int guessIndex) {
    List<Guess> guesses = [...state.solver!.guesses];
    bool onlyOneOfEachColor = state.solver!.onlyOneOfEachColor;
    guesses.removeAt(guessIndex);
    state = state.copyWith(
        solver:
            Solver(guesses: guesses, onlyOneOfEachColor: onlyOneOfEachColor));
  }

  void setOnlyOneOfEachColor(bool onlyOneOfEachColor) {
    List<Guess> guesses = [...state.solver!.guesses];
    state = state.copyWith(
        solver:
            Solver(guesses: guesses, onlyOneOfEachColor: onlyOneOfEachColor));
  }

  @override
  SolverState build() {
    return SolverState(solver: Solver(guesses: [], onlyOneOfEachColor: false));
  }
}
