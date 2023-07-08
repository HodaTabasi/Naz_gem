import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesListWidget extends StatelessWidget {
  const ImagesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0.r),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                  "https://www.idonate.ie/images/newimage/sports-clubs-1.jpg",
                  fit: BoxFit.cover,
                  width: 120.w,
                  height: 130.h),
            ),
          );
        },
      ),
    );
  }
}
