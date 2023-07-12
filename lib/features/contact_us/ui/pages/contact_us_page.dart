import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';
import 'package:naz_gem/features/contact_us/ui/widgets/contact_class.dart';

import '../widgets/ContactLowerSctionsWidget.dart';
import '../widgets/ContactUpperSectionsWidget.dart';

class ContactUsPage extends StatefulWidget {
  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: getAppBar(
        text: 'contact_us'.tr,
        isBack: true,
        height: 80.h,
        textColor: Colors.white,
      ),
      body: Stack(
        children: const [
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            child: ContactUpperSectionsWidget(),
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: ContactLowerSctionsWidget(),
          ),
        ],
      ),
    );
  }
}

