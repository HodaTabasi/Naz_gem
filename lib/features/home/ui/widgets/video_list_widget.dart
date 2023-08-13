import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/home/ui/get/home_getx_controller.dart';
import 'package:naz_gem/features/home/ui/pages/show_vedio.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../domain/entities/gallery.dart';

class VideosListWidget extends StatefulWidget {
  HomeGetxController controller;

  VideosListWidget(
    this.controller, {
    super.key,
  });

  late List<Gallery> videos =
      controller.galleries.where((p0) => p0.typeName == 'Yotube').toList();

  @override
  State<VideosListWidget> createState() => _VideosListWidgetState();
}

class _VideosListWidgetState extends State<VideosListWidget> {
  // late YoutubePlayerController _controller;

  // @override
  // void initState() {
  //   _controller = YoutubePlayerController(
  //     initialVideoId: 'iLnmTe5Q2Qw',
  //     flags: const YoutubePlayerFlags(
  //       autoPlay: true,
  //       mute: false,
  //     ),
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        itemCount: widget.videos.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Get.to(()=>VideoPlayerScreen(widget.videos[index].yotubeVedioUrl!.split("=").last));
              showDialog(
                context: context,
                builder: (context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                     color: Colors.black.withOpacity(0.7),
                    ),
                    child: VideoPlayerScreen(widget.videos[index].yotubeVedioUrl!.split("=").last),
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
                      widget.videos[index].thumbnailPath != null
                          ? widget.videos[index].thumbnailPath!
                          : "https://www.idonate.ie/images/newimage/sports-clubs-1.jpg",
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
