import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuessCircle extends ConsumerWidget {
  const GuessCircle({super.key, this.color, required this.guessIndex, required this.pegIndex, this.onGuessPegTap});
  final Color? color;
  final int guessIndex;
  final int pegIndex;
  final void Function(int guessIndex, int pegIndex)? onGuessPegTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Material(
              shape: const CircleBorder(),
              color: color,
              child: InkWell(
                onTap: () => onGuessPegTap!(guessIndex, pegIndex),
              child: Ink(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                height: 40,
                width: 40,
              ),
            ))));
  }
}
