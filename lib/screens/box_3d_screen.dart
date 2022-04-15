import 'dart:math';

import "package:flutter/material.dart";
import 'package:test_app/widgets/navigation_drawer_widgtet.dart';
import '../widgets/side_widget.dart';

class Box3dScreen extends StatefulWidget {
  const Box3dScreen({Key? key}) : super(key: key);

  static const route = '/box_3d';

  @override
  State<Box3dScreen> createState() => _Box3dScreenState();
}

class _Box3dScreenState extends State<Box3dScreen> {
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      Scaffold(
        appBar: AppBar(title: const Text("Box 3d page")),
        body: Center(
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                _offset += details.delta;
              });
            },
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: Colors.black45,
                ),
              ),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateX(_offset.dy * pi / 360)
                  ..rotateY(-_offset.dx * pi / 360),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const SideWidget(number: 1, color: Color(0xFFFA8EBF)),
                    // Transform(
                    //   transform: Matrix4.identity()..rotateX(-pi / 2),
                    //   origin: const Offset(0, 200),
                    //   child: const SideWidget(),
                    // ),
                    Transform(
                      transform: Matrix4.identity()..rotateY(pi / 2),
                      origin: const Offset(200, 100),
                      child: const SideWidget(number: 3, color: Color(0xFF44FF00)),
                    ),
                    Transform(
                      transform: Matrix4.identity()..rotateY(-pi / 2),
                      origin: const Offset(0, 0),
                      child: const SideWidget(
                        number: 4,
                        color: Color.fromARGB(255, 255, 163, 50),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(0, 0, 200),
                      origin: const Offset(0, 0),
                      child: const SideWidget(
                        number: 5,
                        color: Color.fromARGB(255, 126, 27, 255),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.identity()..rotateX(pi / 2),
                      origin: const Offset(0, 0),
                      child: const SideWidget(number: 6, color: Color(0xFFD722FF)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
