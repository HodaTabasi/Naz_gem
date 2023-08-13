import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naz_gem/features/home/ui/get/home_getx_controller.dart';
import 'package:naz_gem/features/home/ui/widgets/widget_functions.dart';

import '../../../../core/widgets/app_widget.dart';
import '../../domain/entities/gallery.dart';

class ImagesListWidget extends StatelessWidget {
  HomeGetxController controller;
   ImagesListWidget(this.controller ,{
    super.key,
  });
  late List<Gallery> images = controller.galleries.where((p0) => p0.typeName == 'Image').toList();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child:images.isEmpty
          ? buildCenterNoData('لا يوجد بيانات للعرض')
          :  ListView.builder(
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              buildImageDialog(context,images[index].attachment);
              // showImageDialog(context:context,url:"https://www.idonate.ie/images/newimage/sports-clubs-1.jpg");
            },
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                    images[index].attachment??'https://www.idonate.ie/images/newimage/sports-clubs-1.jpg',
                    fit: BoxFit.cover,
                    width: 120.w,
                    height: 130.h),
              ),
            ),
          );
        },
      ),
    );
  }


}
