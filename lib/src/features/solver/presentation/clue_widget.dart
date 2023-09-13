import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind_solver/src/features/solver/domain/clue.dart';
import 'package:mastermind_solver/src/features/solver/presentation/clue_circle_widget.dart';

class ClueWidget extends ConsumerWidget {
  const ClueWidget({super.key, this.clue});
  final Clue? clue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClueCircleWidget(
              color: clue?.getColorForState(0),
            ),
            ClueCircleWidget(
              color: clue?.getColorForState(1),
            ),
          ]),
      Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClueCircleWidget(
              color: clue?.getColorForState(2),
            ),
            ClueCircleWidget(
              color: clue?.getColorForState(3),
            ),
          ]),
    ]);
  }
}
