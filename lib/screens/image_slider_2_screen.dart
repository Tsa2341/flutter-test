import "package:flutter/material.dart";
import 'package:test_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:test_app/widgets/dot_page_indicator_widget.dart';
import 'package:test_app/widgets/navigation_drawer_widgtet.dart';

class ImageSliderScreen2 extends StatefulWidget {
  const ImageSliderScreen2({Key? key}) : super(key: key);

  static const route = '/image_slider_page_2';

  @override
  State<ImageSliderScreen2> createState() => _ImageSliderScreen2State();
}

class _ImageSliderScreen2State extends State<ImageSliderScreen2> {
  int currentPage = 1;
  final double totalPages = 4;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      Scaffold(
        appBar: AppBar(
          title: const Text("Second page of slider"),
        ),
        body: Hero(
          tag: "dot_page_indicator",
          child: DotPageIndicatorWidget(
            focusedColor: Color(0xFF46FF09),
            unFocusedColor: const Color(0x5546FF09),
            number: totalPages,
            pageIndex: currentPage,
            size: 15,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              currentPage++;
              if (currentPage > totalPages) currentPage = 1;
            });
          },
          child: const Icon(Icons.plus_one),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }
}
