import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:naz_gem/features/profile/ui/pages/qr_screen.dart';

import '../../../../core/widgets/app_widget.dart';
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
      appBar: AppBar(
        toolbarHeight: 90.h,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: getText(
          'profile'.tr,
          color: Colors.white,
          size: 20.sp,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(()=>EditProfileScreen());
              },
              icon: SvgPicture.asset('assets/images/edit.svg'))
        ],
      ),
      body: Stack(
        children: [

          PositionedDirectional(
              top: 0,
              start: 0,
              end: 0,
              child: Column(
                children: [
                  getSpace(h: 16.h),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 40.r,
                    ),
                    title: getText('ديما الشرفا',
                        color: Colors.white,
                        size: 20.sp,
                        weight: FontWeight.bold),
                    subtitle: Text.rich(
                      TextSpan(
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp),
                        children: [
                          TextSpan(text: 'id_number'.tr),
                          TextSpan(text: ' 123456789 '),
                        ],
                      ),
                    ),
                    trailing: InkWell(
                      onTap: (){
                        Get.to(()=>QRScreen());
                      },
                        child: SvgPicture.asset('assets/images/qr.svg')
                    ),
                  ),
                  getSpace(h:8.h),
                  Padding(
                    padding:  EdgeInsets.all(16.0.r),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          getText('الباقة الخاصة',size: 14.sp,color: mainColor),
                          const Padding(
                            padding:  EdgeInsets.all(5.0),
                            child: VerticalDivider(
                              color: Colors.white,
                              thickness: 2,
                            ),
                          ),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.sp),
                          children: [
                            TextSpan(text: 'expire_date'.tr),
                            TextSpan(text: ' 10/10/2024 '),
                          ],
                        ),
                      ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: Container(
              padding: EdgeInsets.all(16.r),
              height: MediaQuery.of(context).size.height - 300.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r))),
              child: Column(
                children: [
                  getSpace(h: 16.h),
                  ItemWidget(text:'+966595111957',icon:'assets/images/phonee.svg'),
                  ItemWidget(text:'dimashurafa@gmail.com',icon:'assets/images/emaile.svg'),
                  ItemWidget(text:'dD/MM/YYYY',icon:'assets/images/birth.svg'),
                  ItemWidget(text:'185',icon:'assets/images/hh.svg'),
                  ItemWidget(text:'+AB',icon:'assets/images/bload.svg'),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final String icon;
  final String text;
  const ItemWidget({
    super.key,
   required this.icon,
   required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration:BoxDecoration(
        color: grayBackground,
            borderRadius: BorderRadius.circular(10)
                  ),
          child: ListTile(
            leading:SvgPicture.asset(icon) ,
            title: getText(text,color: Colors.black,size: 16.sp),
          ),
        ),
        getSpace(h: 16.h)
      ],
    );
  }
}
