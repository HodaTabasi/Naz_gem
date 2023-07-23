import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_widget.dart';

class WorkTimeWidget extends StatelessWidget {
  const WorkTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: boarderColor,
            width: 1
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.0.r),
        child: ListTile(
          leading: SvgPicture.asset('assets/images/time_work.svg'),
          title:Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: getText('السبت - الخميس : 8:00 صباحًا لـ 10:00 مسائًا',color: blackTextColor,size: 14.sp),
          ) ,
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: getText('الجمعة : 4:00 لـ 10:00 مسائًا',color: blackTextColor,size: 14.sp),
          ),
        ),
      ),
    );
  }
}
