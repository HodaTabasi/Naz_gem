import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUpperSectionsWidget extends StatelessWidget {
  const ContactUpperSectionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/contact_image.png'),
              fit: BoxFit.fill)),
    );
  }
}
