import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_colors.dart';

import '../../../../core/widgets/app_widget.dart';
import '../../../home/ui/widgets/widget_functions.dart';
import '../widgets/lower_section/lower_section_widget.dart';
import '../widgets/upper_section/upper_section_widget.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: btnColor,
      appBar: buildAppBar(),
      body: Stack(
        children: const [
          PositionedDirectional(
              top: 0,
              start: 0,
              end: 0,
              child: UpperSectionWidget()
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: LowerSectionWidget(),
          ),
        ],
      ),
    );
  }


}








