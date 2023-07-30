import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/network/app_setting.dart';
import 'package:naz_gem/features/profile/ui/get/edit_profile_getx_controller.dart';

import '../../../../../core/widgets/app_widget.dart';
import '../../pages/qr_screen.dart';

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileGetxController>(
        builder: (controller) {
      return ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(controller.myUser.profileImage != null
              ? controller.myUser.profileImage!
              : "https://1.bp.blogspot.com/-4l0CGOzR_2s/YGAWcctx5XI/AAAAAAAAVkU/ziLQpEpGhFUyhAyz76IUgaHnEibKanltACLcBGAsYHQ/w528-h640/5.jpg"),
          radius: 40.r,
        ),
        title: getText(
            '${controller.myUser.firstName} ${controller.myUser.lastName}',
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
              TextSpan(text: ' ${controller.myUser.identifier} '),
            ],
          ),
        ),
        trailing: InkWell(
            onTap: () {
              Get.to(() => QRScreen(),
                  transition: Transition.downToUp,
                  duration: const Duration(milliseconds: 500));
            },
            child: SvgPicture.asset('assets/images/qr.svg')),
      );
    });
  }
}
