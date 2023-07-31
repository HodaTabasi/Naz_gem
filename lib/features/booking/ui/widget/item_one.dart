import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/booking/domain/entities/reservation_session.dart';
import 'package:naz_gem/features/booking/ui/get/user_session_getx_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/snackbar_message.dart';
import '../../../../core/constants/utils.dart';
import '../../../../core/widgets/app_widget.dart';
import '../get/avaibale_getx_controller.dart';
import 'item1_widget/rich_data.dart';
import 'name_of_exercise_widget.dart';

class ItemOneWidget extends StatelessWidget {
  final Color backgroundColor;
  final bool flag;
  ReservationSession reservationSession;

  var my;

  ItemOneWidget({
    super.key,
    required this.flag,
    required this.backgroundColor,
    this.my = true,
    required this.reservationSession,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 110.h,
      margin: EdgeInsets.symmetric(vertical: 5.r),
      decoration: BoxDecoration(
          color: itemBackgroundColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: Stack(
        children: [
          Container(
            width: 10,
            // height: ,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r))),
          ),
          PositionedDirectional(
              end: my ? 8.w : 0.w,
              bottom: 20.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  nameOfExerciseWidget(
                    text1:
                        '${reservationSession.trainingSession?.sessionType} -',
                    text2: ' ${reservationSession.trainingSession?.name}',
                  ),
                  Row(
                    children: [
                      RishWidget(
                        text:
                            ' ${getTimeFrom24(reservationSession.trainingSession!)} ',
                        icon: Icons.timer_outlined,
                      ),
                      getSpace(w: 8.h),
                      Visibility(
                        visible: flag,
                        child: RishWidget(
                          text: ' تدريب فردي ',
                          icon: Icons.person_outline,
                        ),
                      ),
                      getSpace(w: 16.h),
                      Opacity(
                        opacity: my ? 1 : 0,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(95.w, 35.h),
                                textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                    fontFamily: 'br'),
                                backgroundColor: redColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r))),
                            onPressed: () async {
                              bool done = await UserSessionGetxController.to
                                  .cancelUserSessions(
                                      reservationSession.id.toString(),
                                      date: reservationSession
                                          .trainingSession?.date);
                              if (!done) {
                                SnackBarMessage.showErrorSnackBar(
                                    message: UserSessionGetxController
                                        .to.responseMessage,
                                    context: context);
                              } else {
                                AvailableGetxController.to
                                    .increaseAvailableSession(
                                        reservationSession.trainingSession);
                              }
                            },
                            child: Text(
                              'cancel_booking'.tr,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  fontFamily: 'br'),
                            )),
                      )
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
