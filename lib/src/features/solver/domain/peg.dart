import 'package:flutter/material.dart';
import 'package:mastermind_solver/src/constants/colors.dart';

const pegCount = 4;

enum PegState {
  notSelected,
  color1,
  color2,
  color3,
  color4,
  color5,
  color6,
}

Map<PegState, Color> pegColorMap = {
  PegState.notSelected: grey,
  PegState.color1: red,
  PegState.color2: blue,
  PegState.color3: green,
  PegState.color4: white,
  PegState.color5: black,
  PegState.color6: yellow,
};

