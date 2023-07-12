import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_widget.dart';

class QRScreen extends StatefulWidget {

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: btnColor,
      appBar:  getAppBar(
        text: 'qr'.tr,
        textColor: Colors.white,
        height: 80.h,
        isBack: true,

      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width-50.h,
          height: 508.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                blurRadius: 15,
              ),
            ]
          ),
          child: Column(
            children: [
              const Spacer(),
              QrImageView(
                data: 'This is a simple QR code',
                version: QrVersions.auto,
                size: 250,
                gapless: false,
                foregroundColor: btnColor,
              ),
              const Spacer(),
              Padding(
                  padding: EdgeInsets.all(16.r),
                child: Text.rich(
                  TextSpan(
                    style:
                    TextStyle(color: Colors.black,fontSize: 20.sp),
                    children: [
                      TextSpan(text: 'id_number'.tr),
                      TextSpan(text: '123456789'),
                    ],
                  ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
