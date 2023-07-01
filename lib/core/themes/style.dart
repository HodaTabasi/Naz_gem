import 'package:flutter/material.dart';

import '../../SizeConfig.dart';
import '../constants/app_colors.dart';

TextStyle getTextStyle({size,color,weight}){
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: weight,
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  focusedBorder: outlineInputBorder(),
  enabledBorder: enableOutlineInputBorder(),
  fillColor: grayColor,
  filled: true,
  counterStyle: TextStyle(height: double.minPositive,),
  counterText: "",
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
    // borderSide: BorderSide(color: Color(0xffDCDCDC)),
  );
}
OutlineInputBorder enableOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
    borderSide: BorderSide.none,
  );
}
