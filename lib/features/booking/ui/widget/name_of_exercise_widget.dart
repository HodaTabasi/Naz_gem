import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class nameOfExerciseWidget extends StatelessWidget {
  TextStyle? style;
  String text1;
  String text2;

  nameOfExerciseWidget({
    super.key,
    this.style,
    required this.text1,
    required this.text2
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: style,
        children: [
          TextSpan(text: text1),
          TextSpan(
              text: text2,
              style: TextStyle(color: goldenColor)),
        ],
      ),
    );
  }
}