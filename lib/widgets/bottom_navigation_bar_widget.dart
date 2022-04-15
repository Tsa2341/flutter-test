import 'package:flutter/material.dart';
import 'package:test_app/screens/image_slider_1_sccreen.dart';
import 'package:test_app/screens/image_slider_2_screen.dart';
import 'package:test_app/widgets/bottom_navigation_button_widget.dart';
import 'package:test_app/helpers/navigator_function.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

  static late BuildContext contextOut;

  @override
  Widget build(BuildContext context) {
    contextOut = context;
    return Hero(
      flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  Whatch out for this
        return DefaultTextStyle(
          style: DefaultTextStyle.of(toHeroContext).style,
          child: toHeroContext.widget,
        );
      },
      tag: "row",
      child: Container(
        height: 70,
        color: Colors.yellowAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BottomNavigatioButtonWidget(
              const Text("page 1"),
              const Color(0xFFBCFF36),
              () => navigatorFunc(context: context, widget: const ImageSliderScreen1()),
            ),
            BottomNavigatioButtonWidget(
              const Text("page 2"),
              const Color(0xFF36FFA1),
              () => navigatorFunc(context: context, widget: const ImageSliderScreen2()),
            ),
          ],
        ),
      ),
    );
  }
}
