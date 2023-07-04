import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/utils.dart';

import '../../../../core/constants/app_colors.dart';

class MorePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        toolbarHeight: 60.h,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("more".tr,
            style: TextStyle(color: blackTextColor, fontSize: 20.sp)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: Utils.data.length,
          padding: EdgeInsets.all(16.r),
          itemBuilder: (context, index) {
            return itemWidget(
              text: Utils.data[index].title,
              icon: Utils.data[index].icon,
            );
          },),
    );
  }
}

class itemWidget extends StatelessWidget {
 final String icon;
 final String text;
  const itemWidget({
    super.key,
    required this.icon,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0.r),
      child: ListTile(
        tileColor: grayBackground,
        contentPadding: EdgeInsets.all(5.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r)
        ),
        title: Text(text,style: TextStyle(color: blackTextColor, fontSize: 14.sp)),
        trailing: Icon(Icons.arrow_forward_ios),
        leading: SvgPicture.asset(icon),
      ),
    );
  }
}

