import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuessCircle extends ConsumerWidget {
  const GuessCircle({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Material(
              shape: const CircleBorder(),
              color: color,
              child: Ink(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                height: 40,
                width: 40,
              ),
            )));
  }
}
