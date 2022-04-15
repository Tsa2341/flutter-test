import 'package:flutter/material.dart';

class BottomNavigatioButtonWidget extends StatelessWidget {
  const BottomNavigatioButtonWidget(this.title, this.color, this.pressed,
      {Key? key})
      : super(key: key);

  final Widget title;
  final Color color;
  final Function pressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pressed(),
      child: Container(
        height: double.infinity,
        width: 60,
        margin: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 2),
            blurRadius: 2,
          )
        ], color: color, borderRadius: BorderRadius.circular(10)),
        child: FittedBox(child: title),
      ),
    );
  }
}
