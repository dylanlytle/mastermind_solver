import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind_solver/src/constants/color_schemes.dart';
import 'package:mastermind_solver/src/features/solver/domain/guess.dart';
import 'package:mastermind_solver/src/features/solver/presentation/guess_card.dart';

class SolverScreen extends ConsumerWidget {
  SolverScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(child: Text('Mastermind Solver')),
          toolbarHeight: 64,
          backgroundColor: darkColorScheme.surface,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              GuessCard(guess: Guess()),
            ])));
  }
}
