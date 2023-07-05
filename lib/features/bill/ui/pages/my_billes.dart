import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../widget/myBillWidgets/item_widget.dart';

class MyBilles extends StatefulWidget {
  @override
  State<MyBilles> createState() => _MyBillesState();
}

class _MyBillesState extends State<MyBilles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:getAppBar(
          text: "my_bill".tr,
          height: 80.h
      ),
      body: ListView.builder(
        itemCount: 3,
        padding: EdgeInsets.all(16.r),
        itemBuilder: (context, index) {
          return MyItemWidget(index: index);
        },
      ),
    );
  }
}

