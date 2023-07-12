import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naz_gem/features/profile/ui/widgets/upper_section/pakage_info_widget.dart';
import 'package:naz_gem/features/profile/ui/widgets/upper_section/personal_Info_widget.dart';

import '../../../../../core/widgets/app_widget.dart';

class UpperSectionWidget extends StatelessWidget {
  const UpperSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getSpace(h: 16.h),
        const PersonalInfoWidget(),
        // getSpace(h:8.h),
        const PakageInfoWidget()
      ],
    );
  }
}