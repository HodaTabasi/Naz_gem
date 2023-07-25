import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_colors.dart';

class DataTextField extends StatelessWidget {
  DataTextField({
    Key? key,
    required TextEditingController textController,
    required String hint,
    String? prefixIcon,
    TextInputType textInputType = TextInputType.text,
    bool obscureText = false,
    TextInputAction textInputAction = TextInputAction.next,
    required VoidCallback onSubmitted,
  })  : _textController = textController,
        _hint = hint,
        _prefixIcon = prefixIcon,
        _textInputType = textInputType,
        _obscureText = obscureText,
        _textInputAction = textInputAction,
        _onSubmitted = onSubmitted,
        super(key: key);

  final TextEditingController _textController;
  final String _hint;
  String? _prefixIcon;
  final TextInputType _textInputType;
  final bool _obscureText;
  final TextInputAction _textInputAction;
  final VoidCallback _onSubmitted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onSubmitted,
      child: SizedBox(
        height: 50.h,
        child: TextField(
          controller: _textController,
          keyboardType: _textInputType,
          textInputAction: _textInputAction,
          enabled: false,
          // onSubmitted: _onSubmitted,
          obscureText: _obscureText,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: blackTextColor
          ),
          decoration: InputDecoration(
            hintText: _hint,
            hintStyle: TextStyle(),
            // prefixIcon: Icon(_prefixIcon),
            // prefixText: _text,
            suffixIcon: SizedBox(
              width: 50.w,
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(_prefixIcon!),
                ),
              ),
            ),
            // prefixStyle: TextStyle(
            //   fontSize: 14.sp,color: blackTextColor
            // ),
            enabledBorder: buildOutlineInputBorder(color:boarderColor),
            focusedBorder: buildOutlineInputBorder(color: boarderColor),
            disabledBorder: buildOutlineInputBorder(color:boarderColor),
          ),
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
