import 'package:flutter/material.dart';
import 'package:test_app/widgets/navigation_drawer_widgtet.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({Key? key}) : super(key: key);

  static const route = "/button_screen";

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      Scaffold(
        appBar: AppBar(
          title: const Text("Button Screen"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                boxShadow: [BoxShadow(offset: Offset.infinite)]),
            width: 200,
            height: 70,
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  gradient: RadialGradient(
                    colors: <Color>[Color(0xFF4CD0CB), Color(0xFF4CD0CB)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 5),
                      color: Colors.black54,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: TextButton(
                  child: const Text(
                    "tap me",
                    style: TextStyle(color: Colors.grey),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
