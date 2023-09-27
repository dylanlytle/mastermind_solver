import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind_solver/src/constants/sizes.dart';

class ClueCircleWidget extends ConsumerWidget {
  const ClueCircleWidget({super.key, this.color, required this.guessIndex, required this.clueIndex, this.onCluePegTap});
  final Color? color;
  final int guessIndex;
  final int clueIndex;
  final void Function(int, int)? onCluePegTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        child: Padding(
            padding: const EdgeInsets.all(guessCirclePadding),
            child: Material(
              shape: const CircleBorder(),
              color: color,
              child: InkWell(
                onTap:() => onCluePegTap!(guessIndex, clueIndex),
                child: Ink(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                height: guessCircleDiameterPixels,
                width: guessCircleDiameterPixels,
              ),
            ))));
  }
}
