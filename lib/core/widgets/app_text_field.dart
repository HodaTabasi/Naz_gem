import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    required TextEditingController textController,
    required String hint,
    IconData? prefixIcon,
    String  text = '',
    TextInputType textInputType = TextInputType.text,
    bool obscureText = false,
    bool hasSufix = false,
    TextDirection direction = TextDirection.rtl,
    TextInputAction textInputAction = TextInputAction.next,
    Function(String value)? onSubmitted,
  })  : _textController = textController,
        _hint = hint,
        _prefixIcon = prefixIcon,
        _textInputType = textInputType,
        _obscureText = obscureText,
        _textInputAction = textInputAction,
        _onSubmitted = onSubmitted,
        _text = text,
  _hasSufix = hasSufix,
        _direction = direction,
        super(key: key);

  final TextEditingController _textController;
  final String _hint;
  IconData? _prefixIcon;
  String _text;
  TextDirection _direction;
  final TextInputType _textInputType;
  final bool _obscureText;
  final bool _hasSufix;
  final TextInputAction _textInputAction;
  final void Function(String value)? _onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      keyboardType: _textInputType,
      textInputAction: _textInputAction,
      onSubmitted: _onSubmitted,
      obscureText: _obscureText,
      textDirection: _direction,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: blackTextColor
      ),
      decoration: InputDecoration(
        hintText: _hint,
        hintStyle: TextStyle(),
        // prefixIcon: Icon(_prefixIcon),
        // prefixText: _text,
        suffixIcon: _hasSufix ?SizedBox(
          width: 60.w,
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_text,style: TextStyle(
                  fontSize: 16.sp,color: blackTextColor,fontFamily: 'tajawal'
              ),textAlign: TextAlign.center, ),
            ),
          ),
        ):null,
        // prefixStyle: TextStyle(
        //   fontSize: 14.sp,color: blackTextColor
        // ),
        enabledBorder: buildOutlineInputBorder(color:boarderColor),
        focusedBorder: buildOutlineInputBorder(color: btnColor),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 1,
        color: color,
      ),
    );
  }
}
