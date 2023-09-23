import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';
import 'package:naz_gem/features/bill/ui/get/bill_getx_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../widget/myBillWidgets/item_widget.dart';

class MyBilles extends StatefulWidget {
  @override
  State<MyBilles> createState() => _MyBillesState();
}

class _MyBillesState extends State<MyBilles> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BillGetXController.to.getBills();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:getAppBar(
          text: "my_bill".tr,
          height: 80.h
      ),
      body: GetX<BillGetXController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.bills.length,
            padding: EdgeInsets.all(16.r),
            itemBuilder: (context, index) {
              return MyItemWidget(bill: controller.bills[index]);
            },
          );
        }
      ),
    );
  }
}

