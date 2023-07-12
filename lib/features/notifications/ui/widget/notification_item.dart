import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_widget.dart';

class NotificationItemWidget extends StatelessWidget {
  final String title;
  final String text;
  const NotificationItemWidget({
    super.key,
    required this.title,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5.0.r),
      child: Column(
        children: [
          ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)
            ),
            title: getText(title,size: 16.sp ,color:blackTextColor),
            subtitle: getText(text,size:12.sp,color: grayTextColor),
            trailing: getText('ساعة',size:12.sp,color: grayTextColor),
          ),
          getDivider()
        ],
      ),
    );
  }
}
