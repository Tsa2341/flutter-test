import 'dart:math';

import 'package:flutter/material.dart';

void navigatorFunc({
  required BuildContext context,
  required Widget widget,
}) {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      maintainState: false,
      opaque: false,
      fullscreenDialog: true,
      transitionDuration: const Duration(milliseconds: 1500),
      pageBuilder: (context, animation, secondaryAnimation) {
        return widget;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = -0.3;
        const end = 0.0;
        final tween = Tween<double>(begin: begin, end: end).chain(CurveTween(curve: Curves.elasticOut));
        final tweenRotationY = Tween<double>(begin: -pi / 2, end: 0.0).chain(CurveTween(curve: Curves.elasticOut));
        final doubleAnimation = animation.drive(tween);
        final doubleAnimationTotaionY = animation.drive(tweenRotationY);

        return RotationTransition(
          turns: doubleAnimation,
          alignment: Alignment.topRight,
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(doubleAnimationTotaionY.value)
              ..rotateX(doubleAnimationTotaionY.value),
            alignment: Alignment.topRight,
            child: child,
          ),
        );
        // return child;
      },
    ),
  );
}
