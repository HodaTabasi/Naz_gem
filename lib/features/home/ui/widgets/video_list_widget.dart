import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosListWidget extends StatefulWidget {
  const VideosListWidget({
    super.key,
  });

  @override
  State<VideosListWidget> createState() => _VideosListWidgetState();
}

class _VideosListWidgetState extends State<VideosListWidget> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
     _controller = YoutubePlayerController(
      initialVideoId: 'iLnmTe5Q2Qw',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20.r)
                      ),
                      child: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        aspectRatio: 3/3,
                        onReady: () {
                      _controller.addListener(() {

                      },);
                      },
                      ),
                    ),
                  );
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Stack(
                  children: [
                    Image.network(
                      "https://www.idonate.ie/images/newimage/sports-clubs-1.jpg",
                      fit: BoxFit.cover,
                      width: 120.w,
                      height: 130.h,
                    ),
                    SizedBox(
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/vedio_icon.svg"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
