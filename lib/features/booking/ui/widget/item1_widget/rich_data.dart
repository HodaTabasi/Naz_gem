
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RishWidget extends StatelessWidget {
  String text;
  IconData icon;

  RishWidget({
    super.key,
    required this.icon,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style:
        TextStyle(color: Colors.grey.shade500),
        children: [
          WidgetSpan(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 4.0),
                child: Icon(icon,
                    color: Colors.grey, size: 15.r),
              )),
          TextSpan(text: text),
        ],
      ),
    );
  }
}

