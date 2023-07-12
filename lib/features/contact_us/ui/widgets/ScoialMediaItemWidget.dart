import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScoialMediaItemWidget extends StatelessWidget {
  const ScoialMediaItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/instagram.svg'),
        SvgPicture.asset('assets/images/facebook.svg'),
        SvgPicture.asset('assets/images/youtube.svg'),
        SvgPicture.asset('assets/images/twitter.svg'),
      ],
    );
  }
}
