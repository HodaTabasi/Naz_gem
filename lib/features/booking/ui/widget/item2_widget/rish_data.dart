import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_widget.dart';

class RishWidget extends StatelessWidget {
  String text;
  IconData icon;
  final Color backgroundColor;

  RishWidget({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.text
  });



  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
            color: grayTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp),
        children: [
          WidgetSpan(child: getSpace(w: 5.r)),
          WidgetSpan(
              child: Icon(
                icon,
                color: backgroundColor,
              )),
          WidgetSpan(child: getSpace(w: 10.r)),
          TextSpan(text: text),
        ],
      ),
    );
  }
}