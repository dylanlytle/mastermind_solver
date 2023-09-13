import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind_solver/src/constants/color_schemes.dart';
import 'package:mastermind_solver/src/features/solver/domain/guess.dart';
import 'package:mastermind_solver/src/features/solver/presentation/clue_widget.dart';
import 'package:mastermind_solver/src/features/solver/presentation/guess_circle.dart';

class GuessCard extends ConsumerWidget {
  const GuessCard({super.key, this.guess});
  final Guess? guess;

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
              color: guess?.getColorForState(0),
            ),
            GuessCircle(
              color: guess?.getColorForState(1),
            ),
            GuessCircle(
              color: guess?.getColorForState(2),
            ),
            GuessCircle(
              color: guess?.getColorForState(3),
            ),
            ClueWidget(clue: guess?.getClue()),
          ]),
    );
  }
}
