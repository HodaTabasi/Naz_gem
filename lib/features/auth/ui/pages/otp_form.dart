import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constants/SizeConfig.dart';
import '../../../../core/themes/style.dart';
import '../get/auth_getx_controller.dart';


class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm>{

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      child: Column(
        children: [
          // SizedBox(height: 10.h),
          Directionality(
            textDirection: TextDirection.ltr,
            child: PinCodeTextField(
            controller: AuthGetxController.to.pinCodeController,
            autoDisposeControllers: false,
            appContext: context,
              mainAxisAlignment: MainAxisAlignment.center,
              length: 4,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              enableActiveFill: true,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textStyle: const TextStyle(
                  fontSize: 16,
                 ),
              pinTheme: PinTheme(
                  borderWidth: 1,
                  fieldWidth: getProportionateScreenWidth(50),
                  fieldHeight: getProportionateScreenHeight(50),
                  selectedColor: Colors.black,
                  inactiveColor: Colors.transparent,
                  activeColor:  Colors.black,
                  shape: PinCodeFieldShape.box,
                  activeFillColor: grayColor,
                  selectedFillColor: grayColor,
                  inactiveFillColor: grayColor,
                  borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
                  fieldOuterPadding:  EdgeInsets.symmetric(horizontal: 8.r,vertical: 8.r)),
              onChanged: (val) {},
            ),
          ),
        ],
      ),
    );
  }


}

//OLD SCREEN CODE

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../core/constants/SizeConfig.dart';
// import '../../../../core/themes/style.dart';
// import '../get/auth_getx_controller.dart';
//
//
// class OtpForm extends StatefulWidget {
//   @override
//   _OtpFormState createState() => _OtpFormState();
// }
//
// class _OtpFormState extends State<OtpForm>{
//   FocusNode? pin1FocusNode;
//   FocusNode? pin2FocusNode;
//   FocusNode? pin3FocusNode;
//   FocusNode? pin5FocusNode;
//   FocusNode? pin6FocusNode;
//   FocusNode? pin4FocusNode;
//   late String myCode;
//   late String smsCode;
//   late List<String> numbers;
//
//   onPress() async {
//
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     pin1FocusNode = FocusNode();
//     pin2FocusNode = FocusNode();
//     pin3FocusNode = FocusNode();
//     pin5FocusNode = FocusNode();
//     pin6FocusNode = FocusNode();
//     pin4FocusNode = FocusNode();
//     // if(Platform.isIOS){
//     //   pin1FocusNode?.addListener(() {
//     //     bool hasFocus = pin1FocusNode!.hasFocus;
//     //     if (hasFocus) {
//     //       KeyboardOverlay.showOverlay(context);
//     //     } else {
//     //       KeyboardOverlay.removeOverlay();
//     //     }
//     //   });
//     //   pin2FocusNode?.addListener(() {
//     //     bool hasFocus = pin2FocusNode!.hasFocus;
//     //     if (hasFocus) {
//     //       KeyboardOverlay.showOverlay(context);
//     //     } else {
//     //       KeyboardOverlay.removeOverlay();
//     //     }
//     //   });
//     //   pin3FocusNode?.addListener(() {
//     //     bool hasFocus = pin3FocusNode!.hasFocus;
//     //     if (hasFocus) {
//     //       KeyboardOverlay.showOverlay(context);
//     //     } else {
//     //       KeyboardOverlay.removeOverlay();
//     //     }
//     //   });
//     //   pin5FocusNode?.addListener(() {
//     //     bool hasFocus = pin5FocusNode!.hasFocus;
//     //     if (hasFocus) {
//     //       KeyboardOverlay.showOverlay(context);
//     //     } else {
//     //       KeyboardOverlay.removeOverlay();
//     //     }
//     //   });
//     // }
//   }
//
//   @override
//   void deactivate() {
//
//     super.deactivate();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     pin1FocusNode!.dispose();
//     pin2FocusNode!.dispose();
//     pin3FocusNode!.dispose();
//     pin5FocusNode!.dispose();
//     pin6FocusNode!.dispose();
//     pin4FocusNode!.dispose();
//   }
//
//   void nextField(String value, FocusNode focusNode) {
//     if (value.length == 1) {
//       focusNode.requestFocus();
//     }
//   }
//   void previousField(String value, FocusNode focusNode) {
//       focusNode.requestFocus();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Form(
//       child: Column(
//         children: [
//           // SizedBox(height: 10.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding:  EdgeInsets.symmetric(horizontal: 8.r,vertical: 8.0.r),
//                 child: SizedBox(
//                   width: getProportionateScreenWidth(50),
//                   height: getProportionateScreenHeight(50),
//                   child: TextFormField(
//                     controller:AuthGetxController.to.num1Controller,
//                     autofocus: true,
//                     focusNode: pin1FocusNode,
//                     obscureText: false,
//                     style: TextStyle(fontSize: 16),
//                     keyboardType: TextInputType.number,
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                     textAlign: TextAlign.center,
//                     decoration: otpInputDecoration,
//                     maxLength: 1,
//                     onChanged: (value) {
//                       print("object");
//                       nextField(value, pin2FocusNode!);
//                       // _getClipboardText();
//                     },
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 8.r,vertical: 8.0.r),
//                 child: SizedBox(
//                   width: getProportionateScreenWidth(50),
//                   height: getProportionateScreenHeight(50),
//                   child: TextFormField(
//                     controller: AuthGetxController.to.num2Controller,
//                     focusNode: pin2FocusNode,
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                     obscureText: false,
//                     style: TextStyle(fontSize: 16),
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: otpInputDecoration,
//                     maxLength: 1,
//                     onChanged: (value){
//                       if (value.isEmpty) {
//                         previousField(value, pin1FocusNode!);
//                       } else {
//                         nextField(value, pin3FocusNode!);
//                       }
//
//                       // if(value.length == 0){
//                       //   pin2FocusNode!.requestFocus();
//                       // }
//                     // _getClipboardText();
//                     },
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 8.r,vertical: 8.0.r),
//                 child: SizedBox(
//                   width: getProportionateScreenWidth(50),
//                   height: getProportionateScreenHeight(50),
//                   child: TextFormField(
//                     controller: AuthGetxController.to.num3Controller,
//                     focusNode: pin3FocusNode,
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                     obscureText: false,
//                     style: TextStyle(fontSize: 16),
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: otpInputDecoration,
//                     maxLength: 1,
//                     onChanged: (value) {
//                       if (value.isEmpty) {
//                         previousField(value, pin2FocusNode!);
//                       } else {
//                         nextField(value, pin5FocusNode!);
//                       }
//
//                       // if(value.length == 0){
//                       //   pin2FocusNode!.requestFocus();
//                       // }
//                     // _getClipboardText();
//                     },
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 8.r,vertical: 8.0.r),
//                 child: SizedBox(
//                   width: getProportionateScreenWidth(50),
//                   height: getProportionateScreenHeight(50),
//                   child: TextFormField(
//                     controller: AuthGetxController.to.num6Controller,
//                     focusNode: pin5FocusNode,
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                     obscureText: false,
//                     style: TextStyle(fontSize: 16),
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: otpInputDecoration,
//                     maxLength: 1,
//                     onChanged: (value) {
//                       if (value.isEmpty) {
//                         previousField(value, pin3FocusNode!);
//                       } else {
//                         pin5FocusNode!.unfocus();
//                         onPress();
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//
// }
