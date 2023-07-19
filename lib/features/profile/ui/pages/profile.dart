import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:naz_gem/features/profile/ui/get/edit_profile_getx_controller.dart';

import '../../../../core/widgets/app_widget.dart';
import '../widgets/lower_section/lower_section_widget.dart';
import '../widgets/profile_functions.dart';
import '../widgets/upper_section/upper_section_widget.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    EditProfileGetxController.to.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileGetxController>(builder: (controller) {
      return Scaffold(
          // extendBodyBehindAppBar: true,
          backgroundColor: controller.isLoading ? Colors.white : btnColor,
          appBar: buildAppBar(),
          body: controller.isLoading
              ? const Center()
              : Stack(
                  children: const [
                    PositionedDirectional(
                      top: 0,
                      start: 0,
                      end: 0,
                      child: UpperSectionWidget(),
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      start: 0,
                      end: 0,
                      child: LowerSectionWidget(),
                    ),
                  ],
                ));
    });
  }
}
