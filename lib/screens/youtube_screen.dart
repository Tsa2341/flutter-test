import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/youtube_bloc.dart';
import 'package:test_app/models/youtube_model.dart';
import 'package:test_app/widgets/youtube_video_card_widget.dart';

class YoutubeScreen extends StatefulWidget {
  const YoutubeScreen({Key? key}) : super(key: key);

  static const route = 'youtube_screen_route';

  @override
  State<YoutubeScreen> createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  late Size size;
  String? callGetSearchRunned;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   YoutubeVideoBloc().add(GetSearch(query: {'q': query['query']!}))
  // }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> query = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Youtube screen")),
        body: BlocProvider(
          create: (_) {
            return YoutubeVideoBloc();
          },
          child: Column(
            children: [
              BlocBuilder<YoutubeVideoBloc, List<YoutubeVideo>?>(builder: (context, state) {
                callGetSearchRunned ??= emitGetSearch(context, query);
                if (state != null) {
                  print(state.toString());
                  // if (snapshot.hasError) {
                  //   log(snapshot.error.toString());
                  //   return const Text("error in fetching a http");
                  // } else {
                  List<YoutubeVideo> data = state;
                  return SizedBox(
                    height: size.height - 90,
                    child: YtbVideoCardWidget(data),
                  );
                  // }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

String emitGetSearch(BuildContext context, Map<String, String> query) {
  context.read<YoutubeVideoBloc>().add(GetSearch(query: {'q': query['query']!}));
  return 'runned';
}
