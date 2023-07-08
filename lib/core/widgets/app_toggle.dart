import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

class AppToggle extends StatefulWidget {


  @override
  State<AppToggle> createState() => _AppToggleState();
}

class _AppToggleState extends State<AppToggle> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 8.r),
      child: Container(
          height: 53.h,
          decoration: BoxDecoration(
              border: Border.all(color: boarderColor, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                          MediaQuery.of(context).size.width / 2.2,
                          currentIndex == 0 ? 80 : 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r))),
                      backgroundColor:
                      currentIndex == 0 ? blackTextColor : tabColor,
                      elevation: 0),
                  onPressed: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: Text(
                    'public_pakage'.tr,
                    style: TextStyle(
                        color: currentIndex == 0
                            ? Colors.white
                            : blackTextColor),
                  )),
              // getSpace(w: 8.r),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                          MediaQuery.of(context).size.width / 2.2,
                          currentIndex == 1 ? 80 : 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              bottomLeft: Radius.circular(10.r))),
                      backgroundColor:
                      currentIndex == 1 ? mainColor : tabColor,
                      elevation: 0),
                  onPressed: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: Text('private_pakage'.tr,
                      style: TextStyle(
                          color: currentIndex == 1
                              ? Colors.white
                              : blackTextColor)))
            ],
          )),
    );
  }
}
