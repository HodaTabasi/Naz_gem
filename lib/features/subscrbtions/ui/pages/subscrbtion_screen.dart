import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';
import 'package:naz_gem/core/widgets/app_button.dart';
import 'package:naz_gem/core/widgets/app_text_field.dart';
import 'package:naz_gem/features/auth/ui/widget/date_text_field.dart';
import 'package:naz_gem/features/subscrbtions/data/payment/payment_method.dart';
import 'package:naz_gem/features/subscrbtions/ui/pages/payment_screen.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/snackbar_message.dart';
import '../../../../core/constants/utils.dart';
import '../../../../core/widgets/app_date_text_field.dart';
import '../../../home/ui/get/home_getx_controller.dart';
import '../get/subscrbtions_getx_controller.dart';
import '../widgets/PromoCodeWidget.dart';
import '../widgets/TotalAmountWidget.dart';
import '../widgets/chooeser_widget.dart';

class Subscrbtions extends StatefulWidget {
  @override
  State<Subscrbtions> createState() => _SubscrbtionsState();
}

class _SubscrbtionsState extends State<Subscrbtions> {
  int groupValue = 0;

  DateTime currentDate = DateTime.now();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      cancelText: 'الغاء الامر',
      confirmText: 'حسنا',
      textDirection: TextDirection.rtl,
      helpText: 'حدد التاريخ',
      locale: const Locale('ar'),
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
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
        SubscrbtionGetxController.to.dateController.text =
        '${currentDate.year}-${currentDate.month}-${currentDate.day}';
      });
    }
  }


  @override
  void initState() {

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
          PromoCodeWidget(),
          getSpace(h: 8.h),
          getText(
            'activate_date'.tr,
            color: blackTextColor,
            size: 16.sp,
          ),
          getSpace(h: 8.h),
          DataTextField(textController: SubscrbtionGetxController.to.dateController,
            hint: '',
            prefixIcon: 'assets/images/calender.svg',
          onSubmitted:  () {
            _selectDate(context);
          },),
          getSpace(h: 16.h),
          TotalAmountWidget(),
          BtnApp(title: 'pay'.tr, prsee: () async {
            if(SubscrbtionGetxController.to.checkResponse == null){
              SubscrbtionGetxController.to.amount = (getDiscount(SubscrbtionGetxController.to.package)?? SubscrbtionGetxController.to.package.price).toString();

            }else {
              SubscrbtionGetxController.to.amount = (SubscrbtionGetxController.to.checkResponse?.priceAfterPartnerDiscount ?? SubscrbtionGetxController.to.checkResponse?.priceAfterDiscount ?? SubscrbtionGetxController.to.checkResponse?.packagePrice).toString();
            }
              bool done = await SubscrbtionGetxController.to.checkSubscription(SubscrbtionGetxController.to.promoController.text,SubscrbtionGetxController.to.dateController.text,SubscrbtionGetxController.to.amount,SubscrbtionGetxController.to.package.id!);
            if(done){
              PaymentMethod(context).onBookClick(context, SubscrbtionGetxController.to.amount);
              }else {
              SnackBarMessage.showErrorSnackBar(message: SubscrbtionGetxController.to.responseMessage, context: context);
            }
          }, color: btnColor)
        ],
      ),
    );
  }
}


