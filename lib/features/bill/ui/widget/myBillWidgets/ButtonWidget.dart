import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_widget.dart';

class ButtonWidget extends StatelessWidget {
  final Color color;
  final Size size;
  final VoidCallback onPress;
  final String text;
  const ButtonWidget({
    super.key,
    required this.size ,
    required this.color ,
    required this.onPress ,
    required this.text ,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          fixedSize: size,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r))),
      onPressed: onPress,
      child: getText(text,
          color: blackTextColor, size: 12.sp, family: 'br'),
    );
  }
}
