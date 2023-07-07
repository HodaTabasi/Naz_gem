import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';

class TabBarMaterialWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  const TabBarMaterialWidget({
    required this.index,
    required this.onChangedTab,
  });

  @override
  _TabBarMaterialWidgetState createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
  @override
  Widget build(BuildContext context) {
    const placeholder = Opacity(
      opacity: 0,
      child: IconButton(icon: Icon(Icons.no_cell), onPressed: null),
    );

    return BottomAppBar(
      height: 65.h,
      elevation: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabItem(
            index: 0,
            icon: 'assets/images/bottom_images/home.svg',
            iconSelected: 'assets/images/bottom_images/home_selected.svg',
            text: 'home'.tr
          ),
          buildTabItem(
            index: 1,
              icon: 'assets/images/bottom_images/my_bill.svg',
              iconSelected: 'assets/images/bottom_images/my_bill_selected.svg',
              text: 'my_bill'.tr
          ),
          placeholder,
          buildTabItem(
            index: 3,
              icon: 'assets/images/bottom_images/pesrson.svg',
              iconSelected: 'assets/images/bottom_images/profile_selected.svg',
              text: 'profile'.tr
          ),
          buildTabItem(
            index: 4,
              icon: 'assets/images/bottom_images/menu.svg',
              iconSelected: 'assets/images/bottom_images/menu_selected.svg',
              text: 'more'.tr
          ),
        ],
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required String icon,
    required String iconSelected,
    required String text,
  }) {
    final isSelected = index == widget.index;

    return InkWell(
      onTap: ()=>widget.onChangedTab(index),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSelected ?SvgPicture.asset(iconSelected):SvgPicture.asset(icon),
            getText(text,color:isSelected?btnColor:grayTextColor ,size: 12.sp,weight: isSelected?FontWeight.bold:FontWeight.normal)
          ],
        ),
      ),
    );
    
    // return IconTheme(
    //   data: IconThemeData(
    //     color: isSelected ? Colors.red : Colors.black,
    //   ),
    //   child: IconButton(
    //     icon: icon,
    //     onPressed: () => widget.onChangedTab(index),
    //   ),
    // );
  }
}
