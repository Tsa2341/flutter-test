import 'package:flutter/material.dart';
import 'dart:math';

class SideWidget extends StatelessWidget {
  const SideWidget({Key? key, required this.number, required this.color})
      : super(key: key);

  final int number;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFFACEB98), color],
          stops: const <double>[0.3, 1],
          transform: const GradientRotation(pi / 180 * 15),
        ),
      ),
      child: Text(
        number.toString(),
        style: const TextStyle(fontSize: 150, fontWeight: FontWeight.w900),
      ),
    );
  }
}
