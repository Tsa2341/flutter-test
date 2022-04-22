import 'dart:convert';
import 'dart:developer';

import 'package:test_app/models/youtube_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class YtbSearchDatarovider {
  String queryString = 'key=${dotenv.env['YTB_API_KEY']}';

  Future<List<YoutubeVideo>> getData(Map<String, dynamic> query) async {
    Map<String, dynamic> data = <String, dynamic>{};
    final searcBox = Hive.box<Map>('searchs');

    query.forEach((key, value) {
      queryString += '&$key=$value';
    });

    if (searcBox.get(queryString) != null) {
      log('returned cached youtubevideo data');
      return formatSearch(Map<String, dynamic>.from(searcBox.get(queryString)!));
    }

    final response = await http.get(Uri.parse('https://youtube.googleapis.com/youtube/v3/search?part=snippet&$queryString'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      await searcBox.put(queryString, data);
      log('returned fetched youtube video data');
      return formatSearch(data);
    } else {
      throw Exception(response.body);
    }
  }
}

List<YoutubeVideo> formatSearch(Map<String, dynamic> data) {
  List items = data['items'] as List;

  return items
      .map(
        (e) => YoutubeVideo(
          id: e['id']['videoId'],
          chanelId: e['snippet']['channelId'],
          title: e['snippet']['title'],
          chanelTitle: e['snippet']['channelTitle'],
          description: e['snippet']['description'],
          thumbnails: e['snippet']['thumbnails'],
        ),
      )
      .toList();
}
