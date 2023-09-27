import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind_solver/src/constants/color_schemes.dart';
import 'package:mastermind_solver/src/features/solver/presentation/guess_card.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:mastermind_solver/src/features/solver/presentation/solver_controller.dart';

class GuessList extends ConsumerWidget {
  const GuessList({this.onGuessPegTap, this.onCluePegTap, this.onRemoveGuess, super.key});
  final void Function(int, int)? onGuessPegTap;
  final void Function(int, int)? onCluePegTap;
  final void Function(int)? onRemoveGuess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(solverControllerProvider);
    return GuessListLayout(
                itemCount: state.solver!.guesses.length,
                itemBuilder: (_, index) {
                  var guess = state.solver!.guesses[index];
                  return Row(
                    children: [GuessCard(
                    guess: guess,
                    guessIndex: index,
                    onGuessPegTap: onGuessPegTap,
                    onCluePegTap: onCluePegTap,
                    onRemoveGuess: onRemoveGuess,
                  ),
                  FloatingActionButton(
                onPressed: () {
                  onRemoveGuess!(index);
                },
                backgroundColor: darkColorScheme.error,
                child: Icon(
                  Icons.remove,
                  color: darkColorScheme.onError,
                ),
              ),]);
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
    return itemCount <= 0 ? const SizedBox() : LayoutBuilder(builder: (context, constraints) {
      const crossAxisCount = 1;
      final columnSizes = List.generate(crossAxisCount, (_) => auto);
      final numRows = itemCount;
      final rowSizes = List.generate(numRows, (_) => auto);
      return LayoutGrid(
        columnSizes: columnSizes,
        rowSizes: rowSizes,
        rowGap: 10,
        columnGap: 0,
        children: [
          for (var i = 0; i < itemCount; i++) itemBuilder(context, i),
        ],
      );
    });
  }
}
