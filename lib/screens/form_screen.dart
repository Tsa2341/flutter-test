import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_app/screens/youtube_screen.dart';
import 'package:test_app/widgets/navigation_drawer_widgtet.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  static const route = "form_screen";

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> with TickerProviderStateMixin<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      Scaffold(
        appBar: AppBar(title: const Text("Form implementation page")),
        body: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search_sharp),
                  border: OutlineInputBorder(
                    gapPadding: 10,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2),
                  ),
                ),
                validator: (value) {
                  print(value);
                  if (value == null || value.isEmpty) {
                    return "Please write  something!!!";
                  }

                  return null;
                },
                onFieldSubmitted: (value) {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context)
                      ..clearSnackBars()
                      ..showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          padding: const EdgeInsets.all(0),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          duration: const Duration(seconds: 5),
                          content: ScnackbarContentWidget(value),
                        ),
                      );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ScnackbarContentWidget extends StatefulWidget {
  final String _query;
  const ScnackbarContentWidget(this._query, {Key? key}) : super(key: key);

  @override
  State<ScnackbarContentWidget> createState() => _ScnackbarContentWidgetState();
}

class _ScnackbarContentWidgetState extends State<ScnackbarContentWidget> {
  late Timer _timer;
  late int _timerTick = 0;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      log(timer.tick.toString());
      if (timer.tick >= 5) {
        timer.cancel();
        Navigator.pushNamed(context, YoutubeScreen.route, arguments: {"query": widget._query});
      }
      setState(() {
        _timerTick = timer.tick;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [const Color(0x1F2C3C4B), Colors.lightBlue[300]!],
          radius: 25,
          center: const Alignment(-3, -1),
        ),
      ),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
        child: Text('Redirecting in ${5 - _timerTick} seconds'),
      ),
    );
  }
}
