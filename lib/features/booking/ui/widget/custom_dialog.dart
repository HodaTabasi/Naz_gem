import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/app_widget.dart';

class CoustomDialog extends StatelessWidget {
  late String title;
  String? title2;
  late VoidCallback onClick;
  late String image;

  var flag;

  CoustomDialog(
      {required this.title, this.title2, required this.onClick, required this.image,this.flag = false});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0.r),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width-100,
          padding:
              EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
          // margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            // boxShadow: [
            //   BoxShadow(
            //       color: Colors.black, offset: Offset(0, 10), blurRadius: 5),
            // ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SvgPicture.asset("assets/images/$image"),
              getSpace(h: 16.h),
              Text(
                "$title",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600,),
                textAlign: TextAlign.center,
              ),
              Visibility(
                visible: flag,
                  child: getSpace(h: 16.h)),
              Visibility(
                visible: flag,
                child: Text(
                  "$title2",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              getSpace(h: 16.h),
              TextButton(onPressed: onClick, child: getText('back'.tr,size: 16.sp,align: TextAlign.center))

            ],
          ),
        ),
      ],
    );
  }
}
