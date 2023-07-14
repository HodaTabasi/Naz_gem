import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class AppDateTextField extends StatelessWidget {
  AppDateTextField({
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
    required VoidCallback onSubmitted,
  })  : _textController = textController,
        _hint = hint,
        _textInputType = textInputType,
        _obscureText = obscureText,
        _textInputAction = textInputAction,
        _onSubmitted = onSubmitted,
        _text = text,
        _isEnabled =isEnabled ,
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
  final VoidCallback _onSubmitted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onSubmitted,
      child: TextFormField(
        controller: _textController,
        keyboardType: _textInputType,
        textInputAction: _textInputAction,
        autovalidateMode:AutovalidateMode.onUserInteraction ,
        // onSubmitted: _onSubmitted,
        obscureText: _obscureText,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: blackTextColor
        ),
        // validator: _onSubmitted,
        decoration: InputDecoration(
          hintText: _hint,
          enabled: _isEnabled,
          hintStyle: const TextStyle(),
          contentPadding:  EdgeInsets.symmetric(vertical: 13.0.r, horizontal: 13.0.r),
          fillColor: _isEnabled?null:grayBackground,
          filled: !_isEnabled,
          enabledBorder: buildOutlineInputBorder(color:boarderColor),
          focusedBorder: buildOutlineInputBorder(color: btnColor),
          disabledBorder: buildOutlineInputBorder(color:boarderColor),
          errorBorder: buildOutlineInputBorder(color:redColor),
          focusedErrorBorder: buildOutlineInputBorder(color:redColor),
        ),
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
