import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind_solver/src/constants/color_schemes.dart';
import 'package:mastermind_solver/src/features/solver/domain/guess.dart';
import 'package:mastermind_solver/src/features/solver/presentation/clue_widget.dart';
import 'package:mastermind_solver/src/features/solver/presentation/guess_circle.dart';

class GuessCard extends ConsumerWidget {
  GuessCard({super.key, this.guess, required this.guessIndex, this.onGuessPegTap, this.onCluePegTap, this.onRemoveGuess});
  Guess? guess;
  int guessIndex;
  void Function(int, int)? onGuessPegTap;
  void Function(int, int)? onCluePegTap;
  void Function(int)? onRemoveGuess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: darkColorScheme.surfaceVariant,
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GuessCircle(
              color: guess?.getColorForPeg(0),
              guessIndex: guessIndex,
              pegIndex: 0,
              onGuessPegTap: onGuessPegTap!,
            ),
            GuessCircle(
              color: guess?.getColorForPeg(1),
              guessIndex: guessIndex,
              pegIndex: 1,
              onGuessPegTap: onGuessPegTap!,
            ),
            GuessCircle(
              color: guess?.getColorForPeg(2),
              guessIndex: guessIndex,
              pegIndex: 2,
              onGuessPegTap: onGuessPegTap!,
            ),
            GuessCircle(
              color: guess?.getColorForPeg(3),
              guessIndex: guessIndex,
              pegIndex: 3,
              onGuessPegTap: onGuessPegTap!,
            ),
            ClueWidget(clue: guess?.getClue(), guessIndex: guessIndex, onCluePegTap: onCluePegTap),
            
          ]),
    );
  }
}
