import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';
import 'package:naz_gem/core/widgets/app_button.dart';
import 'package:naz_gem/core/widgets/app_text_field.dart';
import 'package:naz_gem/features/auth/ui/widget/date_text_field.dart';
import 'package:naz_gem/features/subscrbtions/ui/pages/payment_screen.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_date_text_field.dart';
import '../widgets/PromoCodeWidget.dart';
import '../widgets/TotalAmountWidget.dart';
import '../widgets/chooeser_widget.dart';

class Subscrbtions extends StatefulWidget {
  @override
  State<Subscrbtions> createState() => _SubscrbtionsState();
}

class _SubscrbtionsState extends State<Subscrbtions> {
  int groupValue = 0;

  var promoController;

  var dateController;
  DateTime currentDate = DateTime.now();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      cancelText: 'الغاء الامر',
      confirmText: 'حسنا',
      textDirection: TextDirection.rtl,
      helpText: 'حدد التاريخ',
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: btnColor, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: blackTextColor, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: btnColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        dateController.text =
        '${currentDate.year}-${currentDate.month}-${currentDate.day}';
      });
  }


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
      appBar: getAppBar(
        text: 'sure_sub'.tr,
        isBack: true,
        height: 80.h,

      ),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          getText(
            'q'.tr,
            color: blackTextColor,
            size: 16.sp,
          ),
          ChooeserWidget(),
          PromoCodeWidget(promoController: promoController),
          getSpace(h: 8.h),
          getText(
            'activate_date'.tr,
            color: blackTextColor,
            size: 16.sp,
          ),
          getSpace(h: 8.h),
          DataTextField(textController: dateController,
            hint: '',
            prefixIcon: 'assets/images/calender.svg',
          onSubmitted:  () {
            _selectDate(context);
          },),
          getSpace(h: 16.h),
          TotalAmountWidget(),
          BtnApp(title: 'pay'.tr, prsee: () {
            Get.to(() => PaymentScreen(), transition: Transition.downToUp,
                duration: const Duration(milliseconds: 300));
          }, color: btnColor)
        ],
      ),
    );
  }
}


