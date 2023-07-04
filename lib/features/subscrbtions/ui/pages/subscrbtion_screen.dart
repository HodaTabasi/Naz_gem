import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_widget.dart';
import 'package:naz_gem/core/widgets/app_button.dart';
import 'package:naz_gem/core/widgets/app_text_field.dart';
import 'package:naz_gem/features/auth/ui/widget/date_text_field.dart';
import 'package:naz_gem/features/subscrbtions/ui/pages/payment_screen.dart';

import '../../../../core/constants/app_colors.dart';

class Subscrbtions extends StatefulWidget {
  @override
  State<Subscrbtions> createState() => _SubscrbtionsState();
}

class _SubscrbtionsState extends State<Subscrbtions> {
  int groupValue = 0;

  var promoController;

  var dateController;

  @override
  void initState() {
    promoController = TextEditingController();
    dateController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80.h,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("sure_sub".tr,
            style: TextStyle(color: blackTextColor, fontSize: 20.sp)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          Text("q".tr,
              style: TextStyle(color: blackTextColor, fontSize: 16.sp)),
          Row(
            children: [
              Expanded(
                child: RadioListTile(
                  value: 0,
                  groupValue: groupValue,
                  onChanged: (val) {
                    setState(() {
                      groupValue = val!;
                    });
                  },
                  title: Text('yes'.tr),
                ),
              ),
              Expanded(
                child: RadioListTile(
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (val) {
                    setState(() {
                      groupValue = val!;
                    });
                  },
                  title: Text('no'.tr),
                ),
              ),
            ],
          ),
          Visibility(
            visible: groupValue == 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("enter_promo".tr,
                    style: TextStyle(color: blackTextColor, fontSize: 16.sp)),
                getSpace(h: 8.h),
                Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                            height: 50.h,
                            child: AppTextField(
                                textController: promoController, hint: ''))),
                    getSpace(w: 16.0.w),

                    DecoratedBox(
                      decoration: BoxDecoration(
                          color:btnColor,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: IconButton(onPressed: (){

                      },icon: Icon(Icons.arrow_forward),color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),

          getSpace(h: 8.h),
          Text("activate_date".tr,
              style: TextStyle(color: blackTextColor, fontSize: 16.sp)),
          getSpace(h:8.h),
          DataTextField(textController: dateController, hint: '',prefixIcon:'assets/images/calender.svg' ,),
          getSpace(h:16.h),
          Container(
            height: 120.h,
            alignment: AlignmentDirectional.center,
              decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background1.png'),
              fit: BoxFit.fill
            ),

          ),
          child: Stack(
            children: [
              ListTile(
                leading: SvgPicture.asset('assets/images/icon.svg'),
                title: Text('payment'.tr),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      " 2000 ريال",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: grayTextColor1,
                          // fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough),
                      textAlign: TextAlign.center,
                    ),
                    getSpace(w:16.r),
                    Text(
                      "1200 ريال",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: blackTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),

                  ],
                ),
              )
            ],
          ),),
          BtnApp(title: 'pay'.tr, prsee: (){
            Get.to(()=>PaymentScreen());
          }, color: btnColor)
        ],
      ),
    );
  }
}
