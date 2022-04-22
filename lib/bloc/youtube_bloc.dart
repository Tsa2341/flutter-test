import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/models/youtube_model.dart';
import 'package:test_app/repository/data/youtube_search_data.dart';

abstract class YtbVideoEvents {}

class GetSearch extends YtbVideoEvents {
  Map<String, String> query;
  GetSearch({required this.query});
}

class YoutubeVideoBloc extends Bloc<YtbVideoEvents, List<YoutubeVideo>?> {
  YoutubeVideoBloc() : super(null) {
    on<GetSearch>(
      (event, emit) async {
        final data = await _ytbSearchDatarovider.getData({'q': event.query});
        emit(data);
      },
    );
  }

  final YtbSearchDatarovider _ytbSearchDatarovider = YtbSearchDatarovider();
}
