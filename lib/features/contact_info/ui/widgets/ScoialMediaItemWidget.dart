import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naz_gem/features/contact_info/ui/get/contact_getx_controller.dart';
import 'package:naz_gem/features/contact_info/ui/widgets/contact_class.dart';

class ScoialMediaItemWidget extends StatelessWidget {
  ContactGetxController controller;
  ScoialMediaItemWidget(this.controller, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NewWidget(url: controller.instagram,image: 'assets/images/instagram.svg'),
        NewWidget(url: controller.facebook,image: 'assets/images/facebook.svg'),
        NewWidget(url: controller.youtube,image: 'assets/images/youtube.svg'),
        NewWidget(url: controller.twitter,image: 'assets/images/twitter.svg'),
      ],
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.url,
    required this.image,
  });

  final String url;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        launch(Uri.parse(url), context);
      },
        child: SvgPicture.asset(image));
  }
}
