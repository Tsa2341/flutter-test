import 'package:flutter/material.dart';
import 'package:test_app/screens/screen1.dart';
import 'package:test_app/widgets/navigation_drawer_widgtet.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  static const route = '/screen2';

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      Scaffold(
        appBar: AppBar(
          title: const Text("SCreen 2"),
          actions: [
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, Screen1.route);
              },
              tooltip: "Navigate to another screen",
              child: const FittedBox(
                child: Text("Click me hahaha"),
              ),
            ),
          ],
        ),
        body: Hero(
          tag: "cloud Image",
          child: Image.network(
            'https://res.cloudinary.com/tsa2341/image/upload/v1644861416/qexizgnang84i8avqxit.jpg',
            fit: BoxFit.fitWidth,
            width: 100,
          ),
        ),
      ),
    );
  }
}
