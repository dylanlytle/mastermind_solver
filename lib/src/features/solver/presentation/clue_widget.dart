import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind_solver/src/features/solver/domain/clue.dart';
import 'package:mastermind_solver/src/features/solver/presentation/clue_circle_widget.dart';

class ClueWidget extends ConsumerWidget {
  const ClueWidget({super.key, this.clue, required this.guessIndex, required this.onCluePegTap});
  final Clue? clue;
  final int guessIndex;
  final void Function(int, int)? onCluePegTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClueCircleWidget(
              color: clue?.getColorForPeg(0),
              guessIndex: guessIndex,
              clueIndex: 0,
              onCluePegTap: onCluePegTap,
            ),
            ClueCircleWidget(
              color: clue?.getColorForPeg(1),
              guessIndex: guessIndex,
              clueIndex: 1,
              onCluePegTap: onCluePegTap,
            ),
          ]),
      Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClueCircleWidget(
              color: clue?.getColorForPeg(2),
              guessIndex: guessIndex,
              clueIndex: 2,
              onCluePegTap: onCluePegTap,
            ),
            ClueCircleWidget(
              color: clue?.getColorForPeg(3),
              guessIndex: guessIndex,
              clueIndex: 3,
              onCluePegTap: onCluePegTap,
            ),
          ]),
    ]);
  }
}
