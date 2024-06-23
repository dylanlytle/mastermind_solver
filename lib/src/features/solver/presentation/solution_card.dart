import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind_solver/src/constants/color_schemes.dart';
import 'package:mastermind_solver/src/features/solver/domain/peg.dart';
import 'package:mastermind_solver/src/features/solver/domain/solution.dart';
import 'package:mastermind_solver/src/features/solver/presentation/solution_circle.dart';

class SolutionCard extends ConsumerWidget {
  SolutionCard({super.key, this.solution, this.onSolutionTap});
  Solution? solution;
  void Function(PegState, PegState, PegState, PegState)? onSolutionTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: darkColorScheme.surfaceVariant,
      child: InkWell(
          onTap: () => {
                onSolutionTap!(
                  solution!.pegs[0],
                  solution!.pegs[1],
                  solution!.pegs[2],
                  solution!.pegs[3],
                )
              },
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
              ])),
    );
  }
}
