import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naz_gem/features/contact_info/ui/get/contact_getx_controller.dart';

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
        child: Row(
          children: [
            getSpace(w: 10.w),
            SvgPicture.asset('assets/images/time_work.svg'),
            getSpace(w: 13.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ContactGetxController.to.workingHour.map((e) {
                return    Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0.r),
                  child: getText('${e['value']}',color: blackTextColor,size: 14.sp,),
                );
              }).toList(),
            ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 5.0),
            //   child: getText('الجمعة : 4:00 لـ 10:00 مسائًا',color: blackTextColor,size: 14.sp),
            // )
          ],
        )

      ),
    );
  }
}
