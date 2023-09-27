import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind_solver/src/constants/color_schemes.dart';
import 'package:mastermind_solver/src/features/solver/domain/solution.dart';
import 'package:mastermind_solver/src/features/solver/presentation/solution_circle.dart';

class SolutionCard extends ConsumerWidget {
  SolutionCard({super.key, this.solution});
  Solution? solution;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: darkColorScheme.surfaceVariant,
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SolutionCircle(
              color: solution?.getColorForPeg(0),
            ),
            SolutionCircle(
              color: solution?.getColorForPeg(1),
            ),
            SolutionCircle(
              color: solution?.getColorForPeg(2),
            ),
            SolutionCircle(
              color: solution?.getColorForPeg(3),
            ),
          ]),
    );
  }
}
