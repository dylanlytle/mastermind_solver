import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind_solver/src/constants/sizes.dart';

class ClueCircleWidget extends ConsumerWidget {
  const ClueCircleWidget({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        child: Padding(
            padding: const EdgeInsets.all(guessCirdlePadding),
            child: Material(
              shape: const CircleBorder(),
              color: color,
              child: Ink(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                height: guessCircleDiameterPixels,
                width: guessCircleDiameterPixels,
              ),
            )));
  }
}
