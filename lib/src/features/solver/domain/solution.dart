import 'package:flutter/material.dart';
import 'package:mastermind_solver/src/features/solver/domain/peg.dart';

class Solution {
  Solution(this.pegs);
  final List<PegState> pegs;

  Color? getColorForPeg(int pegIndex) {
    return pegColorMap[pegs[pegIndex]];
  }
}