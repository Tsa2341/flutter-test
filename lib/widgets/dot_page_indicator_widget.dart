import 'package:flutter/material.dart';

class DotPageIndicatorWidget extends StatelessWidget {
  const DotPageIndicatorWidget({
    Key? key,
    required this.number,
    required this.focusedColor,
    required this.unFocusedColor,
    required this.pageIndex,
    required this.size,
  }) : super(key: key);

  static const route = '/dot_page_1';

  final double number;
  final int size;
  final int pageIndex;
  final Color focusedColor;
  final Color unFocusedColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          createDots(number, pageIndex, focusedColor, unFocusedColor, size),
    );
  }
}

List<Widget> createDots(
  double num,
  int pageIndex,
  Color focusedColor,
  Color unFocusedColor,
  int size,
) {
  List<Widget> widgets = [];

  for (double i = 0; i < num; i++) {
    int wh = pageIndex == (i + 1) ? size + 2 : size;
    widgets.add(AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: wh.toDouble(),
      height: wh.toDouble(),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: pageIndex == (i + 1) ? focusedColor : unFocusedColor,
        shape: BoxShape.circle,
      ),
    ));
  }

  return widgets;
}
