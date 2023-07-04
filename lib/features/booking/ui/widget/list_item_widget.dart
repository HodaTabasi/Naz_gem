import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    required this.item,
  });

  final Widget item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      padding: EdgeInsets.all(8.r),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return this.item;
      },
    );
  }
}