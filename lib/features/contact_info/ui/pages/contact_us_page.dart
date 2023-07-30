import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';
import 'package:naz_gem/features/contact_info/ui/get/contact_getx_controller.dart';

import '../widgets/ContactLowerSctionsWidget.dart';
import '../widgets/ContactUpperSectionsWidget.dart';

class ContactInfoPage extends StatefulWidget {
  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  @override
  void initState() {
    ContactGetxController.to.getContact();
    super.initState();
  }

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
      body: GetX<ContactGetxController>(builder: (controller) {
        return controller.pageLoading.value
            ? buildSizedBoxLoading(context)
            :Stack(
          children: [
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
              child:  ContactLowerSctionsWidget(),
            ),
          ],
        );
      }),
    );
  }

  buildSizedBoxLoading(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: 0.2,
        child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,

          /// Required, The loading type of the widget
          colors: [mainColor, btnColor],

          /// Optional, The color collections
          /// Optional, the stroke backgroundColor
        ),
      ),
    );
  }
}
