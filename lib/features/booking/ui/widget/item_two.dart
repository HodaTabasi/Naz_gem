import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:naz_gem/core/widgets/app_widget.dart';
import 'package:naz_gem/features/booking/domain/entities/session.dart';
import 'package:naz_gem/features/booking/ui/get/user_session_getx_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/snackbar_message.dart';
import '../../../../core/constants/utils.dart';
import 'custom_dialog.dart';
import 'item2_widget/rish_data.dart';
import 'name_of_exercise_widget.dart';

class ItemTwoWidget extends StatelessWidget {
  final String image;
  final Color backgroundColor;
  final Session session;

  const ItemTwoWidget({
    super.key,
    required this.image,
    required this.backgroundColor,
    required this.session
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 220.h,
      margin: EdgeInsets.symmetric(vertical: 5.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          PositionedDirectional(
              child: Padding(
                padding: EdgeInsets.all(16.0.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getSpace(h: 8.r),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundColor: Color(0xffF5F5F5),
                          child: SvgPicture.asset('assets/images/ll.svg'),
                        ),
                        getSpace(w: 8.r),
                        nameOfExerciseWidget(
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp
                          ),
                          text1: '${session.sessionType} -',
                          text2: ' ${session.name}',
                        ),
                      ],
                    ),
                    getSpace(h: 16.r),
                    RishWidget(backgroundColor: backgroundColor,
                      icon: Icons.timer_outlined,
                      text: ' ${getTimeFrom24(session)}  ',),
                    getSpace(h: 8.r),
                    RishWidget(backgroundColor: backgroundColor,
                      icon: Icons.person_outline,
                      text: ' المقاعد المتاحة :${session.availableSeats} ',),
                  ],
                ),
              )),
          PositionedDirectional(
            start: 0,
            end: 0,
            bottom: 0,
            child: InkWell(
              onTap: () async {
                bool done = await UserSessionGetxController.to.reservationUserSessions(session.id.toString());
                if(done){
                  showDialog(context: context,
                      builder: (context) => CoustomDialog(
                        title:'🤩 تم الحجز بنجاح',
                        image:'animation_lk5219r6.json' ,
                        onClick:(){
                          Get.back();
                        },
                        flag: false,)
                  );
                }else {
                  showDialog(context: context,
                      builder: (context) => CoustomDialog(
                        title:'${UserSessionGetxController.to.responseMessage}',
                        image:'animation_lk527tw6.json' ,
                        onClick:(){
                          Get.back();
                        },
                        flag: false,)
                  );
                }

              },
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r))),
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0.r),
                  child: getText(
                    'book_now'.tr,
                    color: GetStorage().read("package_typ") == 1 ? blackTextColor :Colors.white ,
                    size: 16.sp,
                    align: TextAlign.center,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


}

