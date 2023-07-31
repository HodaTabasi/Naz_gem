import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class ShowVideo extends StatefulWidget {
//   String videoId;
//   ShowVideo(this.videoId);
//
//   @override
//   State<ShowVideo> createState() => _ShowVideoState();
// }
//
// class _ShowVideoState extends State<ShowVideo> {
//   late YoutubePlayerController _controller;
//
//   @override
//   void initState() {
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.videoId,
//       flags: YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//         showLiveFullscreenButton: false,
//         loop: true
//       ),
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  YoutubePlayerBuilder(
//           player: YoutubePlayer(
//             controller: _controller,
//             width: MediaQuery.of(context).size.width,
//             // aspectRatio: 2/2,
//           ),
//           builder: (context, player) {
//             return Stack(
//               children: [
//                 PositionedDirectional(
//                   bottom: 0,
//                     child: player),
//                 PositionedDirectional(
//                   end: 0,
//                     top: 0,
//                     child: InkWell(onTap: (){
//                       Get.back();
//                     }, child: Icon(Icons.clear,color: Colors.white,))),
//                 // some widgets
//                 //some other widgets
//               ],
//             );
//           });
//   }
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }


class VideoPlayerScreen extends StatefulWidget {
  // const VideoPlayerScreen({super.key});
  String videoId;
  VideoPlayerScreen(this.videoId);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  // late VideoPlayerController _controller;
    late  YoutubePlayerController _controller;
  // late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        showLiveFullscreenButton: false,
        hideControls: true,
        loop: true
      ),
    );
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(
        text: '',
        isBack: true
      ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body:Stack(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio:2/3,
              // Use the VideoPlayer widget to display the video.
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
            ),
          ),
          PositionedDirectional(
            top: MediaQuery.of(context).size.height/2.5.r,
            start: MediaQuery.of(context).size.width/2,
            child: FloatingActionButton(
              backgroundColor: mainColor,
              onPressed: () {
                // Wrap the play or pause in a call to `setState`. This ensures the
                // correct icon is shown.
                setState(() {
                  // If the video is playing, pause it.
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    // If the video is paused, play it.
                    _controller.play();
                  }
                });
              },
              // Display the correct icon depending on the state of the player.
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          )
        ],
      ),
    );
  }
}