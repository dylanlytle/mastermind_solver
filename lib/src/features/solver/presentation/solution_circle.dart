import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SolutionCircle extends ConsumerWidget {
  const SolutionCircle({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: Material(
              shape: const CircleBorder(),
              color: color,
              child: Ink(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                height: 20,
                width: 20,
              ),
            )));
  }
}
