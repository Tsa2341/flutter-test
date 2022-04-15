import 'package:flutter/material.dart';
import 'package:test_app/widgets/navigation_drawer_widgtet.dart';
import './screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  static const route = '/screen1';

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      Scaffold(
        appBar: AppBar(title: const Text("SCreen 1")),
        body: SizedBox(
          height: 400,
          width: 250,
          child: Hero(
            tag: "cloud Image",
            child: Image.network('https://res.cloudinary.com/tsa2341/image/upload/v1644861416/qexizgnang84i8avqxit.jpg'),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 100,
          height: 100,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const Screen2();
                  },
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    final tween = Tween(begin: begin, end: end);
                    final curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    );

                    return SlideTransition(
                      position: tween.animate(curvedAnimation),
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(seconds: 10),
                ),
              );
            },
            tooltip: "Navigate to another screen",
            child: const Text("Click me"),
          ),
        ),
      ),
    );
  }
}
