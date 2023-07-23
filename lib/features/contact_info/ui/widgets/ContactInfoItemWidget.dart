import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naz_gem/features/contact_info/ui/widgets/contact_class.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_widget.dart';

class ContactInfoItemWidget extends StatelessWidget {
  int index ;
  ContactInfoItemWidget({
    super.key,
    required this.index
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
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.grey.shade100,
          //       offset: const Offset(0,2),
          //       blurRadius: 3
          //   )
          // ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(infoData[index].image),
          getText(
            infoData[index].title,
            size: 12.sp,
            color: blackTextColor,
          ),
          getText(
            infoData[index].text,
            size: 12.sp,
            color: blackTextColor,
          ),
        ],
      ),
    );
  }
}

