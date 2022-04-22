import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_app/models/youtube_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_app/screens/youtube_video_screen.dart';

class YtbVideoCardWidget extends StatelessWidget {
  const YtbVideoCardWidget(this.youtubeVideosInfo, {Key? key}) : super(key: key);

  final List<YoutubeVideo> youtubeVideosInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: youtubeVideosInfo.length,
          itemBuilder: (context, index) {
            final YoutubeVideo data = youtubeVideosInfo[index];
            return SizedBox(
              height: 100,
              width: 400,
              child: GestureDetector(
                onTap: () {
                  log("tapped");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return YoutubeVideoScreen(data.id);
                    }),
                  );
                },
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.black45,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          progressIndicatorBuilder: (context, url, downloadProgress) {
                            return CircularProgressIndicator(value: downloadProgress.progress);
                          },
                          errorWidget: (context, url, error) {
                            return Icon(Icons.error);
                          },
                          fit: BoxFit.cover,
                          imageUrl: data.thumbnails['medium']['url'],
                        ),
                        const SizedBox(
                          width: 10,
                          height: double.infinity,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                data.title!,
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2,
                                    decorationStyle: TextDecorationStyle.solid),
                              ),
                              const SizedBox(
                                  // width: double.infinity,
                                  ),
                              Text.rich(
                                TextSpan(text: data.description!),
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall!,
                                maxLines: 3,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
