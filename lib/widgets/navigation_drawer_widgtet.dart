import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/screens/box_3d_screen.dart';
import 'package:test_app/screens/button.dart';
import 'package:test_app/screens/form_screen.dart';
import 'package:test_app/screens/image_slider_1_sccreen.dart';
import 'package:test_app/screens/image_slider_2_screen.dart';
import 'package:test_app/helpers/navigator_function.dart';
import 'package:test_app/screens/screen1.dart';
import 'package:test_app/screens/screen2.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer(
    this.widget, {
    Key? key,
  }) : super(key: key);

  final Widget widget;

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  double availableHeight = 0;
  double availableWidth = 0;
  double height1 = 400;
  Offset offset = Offset.zero;
  double width1 = 70.0;

  void setWidth1(width) {
    width1 == width ? width1 = 70.0 : width1 = width;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double statusBarSize = MediaQuery.of(context).viewPadding.top;
    if (availableHeight == 0) {
      availableHeight = size.height - height1 + statusBarSize;
      availableWidth = size.width - width1;
      offset = Offset(0, availableHeight / 2);
    }

    return Stack(
      children: [
        widget.widget,
        Positioned(
          top: offset.dy,
          left: offset.dx,
          child: Hero(
            tag: "navigation_drawer",
            child: DefaultTextStyle(
              style: const TextStyle(),
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  Offset position = details.globalPosition;
                  double dx = position.dx;
                  double dy = position.dy;
                  if (position.dx <= 10.0) {
                    dx = 0;
                  } else if (position.dx >= (availableWidth - 10)) {
                    dx = availableWidth;
                  }

                  if (position.dy <= statusBarSize + 10.0) {
                    dy = statusBarSize;
                  } else if (position.dy >= (availableHeight - 10)) {
                    dy = availableHeight;
                  }
                  setState(() {
                    offset = Offset(dx, dy);
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  width: width1,
                  height: height1,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    gradient: const RadialGradient(
                      center: Alignment(-6, -0.5),
                      radius: 6,
                      colors: [Color(0xFF55FF80), Color.fromARGB(230, 103, 156, 254)],
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(
                      color: Colors.black26,
                      width: 1,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PageButton(
                          colors: const [Color(0xFF6FE41B), Color(0xAF439B05)],
                          text: "F1",
                          page: const FormScreen(),
                          setState: setState,
                          setWidth1: setWidth1,
                        ),
                        PageButton(
                          colors: const [Color(0xFF6FE41B), Color(0xAF439B05)],
                          text: "P1",
                          page: const ImageSliderScreen1(),
                          setState: setState,
                          setWidth1: setWidth1,
                        ),
                        PageButton(
                          colors: const [Color(0xFF6FE41B), Color(0xAF439B05)],
                          text: "P2",
                          page: const ImageSliderScreen2(),
                          setState: setState,
                          setWidth1: setWidth1,
                        ),
                        PageButton(
                          colors: const [Color(0xFF6FE41B), Color(0xAF439B05)],
                          text: "P3",
                          page: const ButtonScreen(),
                          setState: setState,
                          setWidth1: setWidth1,
                        ),
                        PageButton(
                          colors: const [Color(0xFF6FE41B), Color(0xAF439B05)],
                          text: "P4",
                          page: const Box3dScreen(),
                          setState: setState,
                          setWidth1: setWidth1,
                        ),
                        PageButton(
                          colors: const [Color(0xFF6FE41B), Color(0xAF439B05)],
                          text: "s1",
                          page: const Screen1(),
                          setState: setState,
                          setWidth1: setWidth1,
                        ),
                        PageButton(
                          colors: const [Color(0xFF6FE41B), Color(0xAF439B05)],
                          text: "s2",
                          page: const Screen2(),
                          setState: setState,
                          setWidth1: setWidth1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PageButton extends StatelessWidget {
  const PageButton({
    Key? key,
    required this.colors,
    required this.text,
    this.setState,
    required this.page,
    required this.setWidth1,
  }) : super(key: key);

  final List<Color> colors;
  final Widget page;
  final Function? setState;
  final Function setWidth1;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorFunc(context: context, widget: page);
      },
      onDoubleTap: () {
        setState!(() {
          setWidth1(300.0);
        });
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(2, 1)),
          ],
          gradient: RadialGradient(
            center: Alignment.topLeft,
            colors: colors,
            radius: 2,
          ),
        ),
        child: FittedBox(
            child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontFamily: GoogleFonts.anticDidone().fontFamily,
            fontFamilyFallback: GoogleFonts.anticDidone().fontFamilyFallback,
          ),
        )),
      ),
    );
  }
}
