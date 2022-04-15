import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/screens/box_3d_screen.dart';
import 'package:test_app/screens/button.dart';
import 'package:test_app/screens/image_slider_1_sccreen.dart';
import 'package:test_app/screens/youtube.screen.dart';
import './screens/screen1.dart';
import './screens/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primaryColor: const Color(0xFFFFCC3E),
      ),
      initialRoute: YoutubeScreen.route,
      routes: {
        YoutubeScreen.route: (context) => const YoutubeScreen(),
        ImageSliderScreen1.route: (context) => const ImageSliderScreen1(),
        ButtonScreen.route: (context) => const ButtonScreen(),
        Box3dScreen.route: (context) => const Box3dScreen(),
        Screen1.route: (context) {
          return const Screen1();
        },
        Screen2.route: (context) {
          return const Screen2();
        }
      },
    );
  }
}
