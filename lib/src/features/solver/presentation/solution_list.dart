import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind_solver/src/constants/color_schemes.dart';
import 'package:mastermind_solver/src/features/solver/domain/guess.dart';
import 'package:mastermind_solver/src/features/solver/domain/peg.dart';
import 'package:mastermind_solver/src/features/solver/presentation/solution_card.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:mastermind_solver/src/features/solver/presentation/solver_controller.dart';

class SolutionList extends ConsumerWidget {
  SolutionList({super.key, this.onSolutionTap});
  void Function(PegState, PegState, PegState, PegState)? onSolutionTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(solverControllerProvider);
    return GuessListLayout(
      itemCount: state.solver!.getSolutions().length,
      itemBuilder: (_, index) {
        var solution = state.solver!.getSolutions()[index];
        return SolutionCard(solution: solution, onSolutionTap: onSolutionTap);
      },
    );
  }
}

class GuessListLayout extends StatelessWidget {
  const GuessListLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return itemCount <= 0
        ? const SizedBox()
        : LayoutBuilder(builder: (context, constraints) {
            const crossAxisCount = 2;
            final columnSizes = List.generate(crossAxisCount, (_) => auto);
            final numRows = 5;
            final rowSizes = List.generate(numRows, (_) => auto);
            return LayoutGrid(
              columnSizes: columnSizes,
              rowSizes: rowSizes,
              rowGap: 10,
              columnGap: 0,
              children: [
                for (var i = 0; i < itemCount && i < 10; i++)
                  itemBuilder(context, i),
              ],
            );
          });
  }
}
