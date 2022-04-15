import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_app/widgets/navigation_drawer_widgtet.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YoutubeScreen extends StatefulWidget {
//   const YoutubeScreen({Key? key}) : super(key: key);

//   static const route = 'youtube_screeen_route';

//   @override
//   State<YoutubeScreen> createState() => _YoutubeScreenState();
// }

// class _YoutubeScreenState extends State<YoutubeScreen> {
//   late final VideoPlayerController _videoController;
//   late final Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _videoController = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');

//     _initializeVideoPlayerFuture = _videoController.initialize();
//   }

//   @override
//   void dispose() {
//     // Ensure disposing of the VideoPlayerController to free up resources.

//     _videoController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return NavigationDrawer(
//       Scaffold(
//         appBar: AppBar(title: const Text("youtube page")),
//         body: Center(
//             child: FutureBuilder(
//           future: _initializeVideoPlayerFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               // If the VideoPlayerController has finished initialization, use
//               // the data it provides to limit the aspect ratio of the video.
//               return AspectRatio(
//                 aspectRatio: _videoController.value.aspectRatio,
//                 // Use the VideoPlayer widget to display the video.
//                 child: VideoPlayer(_videoController),
//               );
//             } else {
//               // If the VideoPlayerController is still initializing, show a
//               // loading spinner.
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         )),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             // Wrap the play or pause in a call to `setState`. This ensures the
//             // correct icon is shown.
//             setState(() {
//               // If the video is playing, pause it.
//               if (_videoController.value.isPlaying) {
//                 _videoController.pause();
//               } else {
//                 // If the video is paused, play it.
//                 _videoController.play();
//               }
//             });
//           },
//           // Display the correct icon depending on the state of the player.
//           child: Icon(
//             _videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );
//   }
// }

class YoutubeScreen extends StatefulWidget {
  const YoutubeScreen({Key? key}) : super(key: key);

  static const route = 'youtube_screen_route';

  @override
  State<YoutubeScreen> createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  late String videoId;
  late YoutubePlayerController _controller;

  void listener() {
    if (mounted && !_controller.value.isFullScreen) {
      setState(() {
        // _playerState = _controller.value.playerState;
        // _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=BBAyRBTfsOU")!;
    print(videoId);

    _controller = YoutubePlayerController(
      initialVideoId: 'BBAyRBTfsOU',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        enableCaption: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Youtube screen")),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              log('Settings Tapped!');
            },
          ),
        ],
        onReady: () {
          _controller.addListener(() {
            setState(() {});
          });
        },
      ),
    );
  }
}
