import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/utils.dart';

import '../../../../core/constants/app_colors.dart';

class NotificationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        toolbarHeight: 60.h,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("notification".tr,
            style: TextStyle(color: blackTextColor, fontSize: 20.sp)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
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
      child: Column(
        children: [
          ListTile(
            // tileColor: grayBackground,
            contentPadding: EdgeInsets.all(5.r),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r)
            ),
            title: Text(text,style: TextStyle(color: blackTextColor, fontSize: 16.sp)),
            subtitle: Text('تمتعي بخصم 20% على جميع الباقات المتاحة',style: TextStyle(color: grayTextColor, fontSize: 12.sp)),
            trailing: Text('ساعة واحدة',style: TextStyle(color: grayTextColor, fontSize: 12.sp)),
          ),
          Divider(
            color: Color(0xffD3D3D3),
            thickness: 1,
          )
        ],
      ),
    );
  }
}

