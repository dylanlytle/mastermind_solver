import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind_solver/src/constants/color_schemes.dart';
import 'package:mastermind_solver/src/features/solver/domain/guess.dart';
import 'package:mastermind_solver/src/features/solver/domain/peg.dart';
import 'package:mastermind_solver/src/features/solver/presentation/guess_list.dart';
import 'package:mastermind_solver/src/features/solver/presentation/solution_list.dart';
import 'package:mastermind_solver/src/features/solver/presentation/solver_controller.dart';

class SolverScreen extends StatelessWidget {
  const SolverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SolverContents();
  }
}

class SolverContents extends ConsumerStatefulWidget {
  const SolverContents({
    super.key,
  });

  @override
  ConsumerState<SolverContents> createState() => _SolverContentsState();
}

class _SolverContentsState extends ConsumerState<SolverContents> {
  void _addGuess() {
    ref.read(solverControllerProvider.notifier).addGuess();
  }

  void _onSolutionTap(PegState pegState1, PegState pegState2,
      PegState pegState3, PegState pegState4) {
    List<PegState> pegs =
        List<PegState>.of([pegState1, pegState2, pegState3, pegState4]);
    Guess guess = Guess.guessFromPegs(pegs);
    ref.read(solverControllerProvider.notifier).addGuessPegs(guess);
  }

  void _removeGuess(int guessIndex) {
    ref.read(solverControllerProvider.notifier).removeGuess(guessIndex);
  }

  void _cycleGuessPegColor(int guessIndex, int pegIndex) {
    ref
        .read(solverControllerProvider.notifier)
        .cycleGuessPeg(guessIndex, pegIndex);
  }

  void _cycleCluePegColor(int guessIndex, int pegIndex) {
    ref
        .read(solverControllerProvider.notifier)
        .cycleCluePeg(guessIndex, pegIndex);
  }

  int _getSolutionCount() {
    return ref.watch(solverControllerProvider).solver!.getSolutions().length;
  }

  bool _getOnlyOneOfEachColor() {
    return ref.watch(solverControllerProvider).solver!.onlyOneOfEachColor;
  }

  void _setOnlyOneOfEachColor(bool value) {
    ref.read(solverControllerProvider.notifier).setOnlyOneOfEachColor(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(child: Text('Mastermind Solver')),
          toolbarHeight: 64,
          backgroundColor: darkColorScheme.surface,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    const Text("Only One of Each Color?"),
                    Switch(
                        // This bool value toggles the switch.
                        value: _getOnlyOneOfEachColor(),
                        activeColor: darkColorScheme.primary,
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            _setOnlyOneOfEachColor(value);
                          });
                        })
                  ]),
                  GuessList(
                      onGuessPegTap: _cycleGuessPegColor,
                      onCluePegTap: _cycleCluePegColor,
                      onRemoveGuess: _removeGuess),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: FloatingActionButton(
                        onPressed: () {
                          _addGuess();
                        },
                        backgroundColor: darkColorScheme.primaryContainer,
                        child: Icon(
                          Icons.add,
                          color: darkColorScheme.onPrimaryContainer,
                        ),
                      )),
                  Text('${_getSolutionCount()}'),
                  SolutionList(onSolutionTap: _onSolutionTap),
                ])));
  }
}
