import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    bool isEnabled = true,
    TextDirection direction = TextDirection.rtl,
    TextInputAction textInputAction = TextInputAction.next,
    String? Function(String? value)? onSubmitted,
  })  : _textController = textController,
        _hint = hint,
        _textInputType = textInputType,
        _obscureText = obscureText,
        _textInputAction = textInputAction,
        _onSubmitted = onSubmitted,
        _text = text,
        _isEnabled = isEnabled,
  _hasSufix = hasSufix,
        _direction = direction,
        super(key: key);

  final TextEditingController _textController;
  final String _hint;
  String _text;
  TextDirection _direction;
  final TextInputType _textInputType;
  final bool _obscureText;
  final bool _hasSufix;
  final bool _isEnabled;
  final TextInputAction _textInputAction;
  final String? Function(String? value)? _onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap:(){
        _textController.selection = TextSelection.fromPosition(TextPosition(offset: _textController.text.length));
      },
      controller: _textController,
      keyboardType: _textInputType,
      textInputAction: _textInputAction,
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      // onSubmitted: _onSubmitted,
      obscureText: _obscureText,
      textDirection: _direction,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: blackTextColor
      ),
      validator: _onSubmitted,
      decoration: InputDecoration(
        hintText: _hint,
        hintStyle: const TextStyle(),
        contentPadding:  EdgeInsets.symmetric(vertical: 13.0.r, horizontal: 13.0.r),
        prefixIcon: _hasSufix ?SizedBox(
          width: 60.w,
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/images/sa.svg'),
              // child: Text(_text,style: TextStyle(
              //     fontSize: 16.sp,color: blackTextColor,fontFamily: 'tajawal'
              // ),textAlign: TextAlign.center, ),
            ),
          ),
        ):null,
        fillColor: grayBackground,
        filled: !_isEnabled,
        enabled: _isEnabled,

        enabledBorder: buildOutlineInputBorder(color:boarderColor),
        focusedBorder: buildOutlineInputBorder(color: btnColor),
        disabledBorder: buildOutlineInputBorder(color: boarderColor),
        errorBorder: buildOutlineInputBorder(color:redColor),
        focusedErrorBorder: buildOutlineInputBorder(color:redColor),
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
