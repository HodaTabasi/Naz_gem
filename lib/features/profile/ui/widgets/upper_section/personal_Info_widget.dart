import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/widgets/app_widget.dart';
import '../../pages/qr_screen.dart';

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        backgroundImage:  NetworkImage("https://1.bp.blogspot.com/-4l0CGOzR_2s/YGAWcctx5XI/AAAAAAAAVkU/ziLQpEpGhFUyhAyz76IUgaHnEibKanltACLcBGAsYHQ/w528-h640/5.jpg"),
        radius: 40.r,
      ),
      title: getText('ديما الشرفا',
          color: Colors.white,
          size: 20.sp,
          weight: FontWeight.bold),
      subtitle: Text.rich(
        TextSpan(
          style: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.normal,
              fontSize: 12.sp),
          children: [
            TextSpan(text: 'id_number'.tr),
            TextSpan(text: ' 123456789 '),
          ],
        ),
      ),
      trailing: InkWell(
          onTap: (){
            Get.to(()=>QRScreen(),transition: Transition.downToUp,
                duration: const Duration(milliseconds: 500));
          },
          child: SvgPicture.asset('assets/images/qr.svg')
      ),
    );
  }
}
