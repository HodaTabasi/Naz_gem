import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

enum WeekStartFrom {
  Sunday,
  Monday,
}

class HorizontalWeekCalendar extends StatefulWidget {
  /// week start from Monday or Sunday
  ///
  /// default value [WeekStartFrom.Monday]
  final WeekStartFrom? weekStartFrom;

  ///get DateTime on date select
  final Function(DateTime)? onDateChange;

  ///get the list of DateTime on week change
  final Function(List<DateTime>)? onWeekChange;

  /// Active background color
  ///
  /// Default value `Theme.of(context).primaryColor`
  final Color? activeBackgroundColor;

  /// In-Active background color
  ///
  /// Default value `Theme.of(context).primaryColor.withOpacity(.2)`
  final Color? inactiveBackgroundColor;

  /// Disable background color
  ///
  /// Default value `Colors.grey`
  final Color? disabledBackgroundColor;

  /// Active text color
  ///
  /// Default value `Theme.of(context).primaryColor`
  final Color? activeTextColor;

  /// In-Active text color
  ///
  /// Default value `Theme.of(context).primaryColor.withOpacity(.2)`
  final Color? inactiveTextColor;

  /// Disable text color
  ///
  /// Default value `Colors.grey`
  final Color? disabledTextColor;

  /// Active Navigator color
  ///
  /// Default value `Theme.of(context).primaryColor`
  final Color? activeNavigatorColor;

  /// In-Active Navigator color
  ///
  /// Default value `Colors.grey`
  final Color? inactiveNavigatorColor;

  /// Month Color
  ///
  /// Default value `Theme.of(context).primaryColor.withOpacity(.2)`
  final Color? monthColor;

  const HorizontalWeekCalendar({
    super.key,
    this.onDateChange,
    this.onWeekChange,
    this.activeBackgroundColor,
    this.inactiveBackgroundColor,
    this.disabledBackgroundColor,
    this.activeTextColor = Colors.white,
    this.inactiveTextColor,
    this.disabledTextColor,
    this.activeNavigatorColor,
    this.inactiveNavigatorColor,
    this.monthColor,
    this.weekStartFrom = WeekStartFrom.Monday,
  });

  @override
  State<HorizontalWeekCalendar> createState() => _HorizontalWeekCalendarState();
}

class _HorizontalWeekCalendarState extends State<HorizontalWeekCalendar> {
  CarouselController carouselController = CarouselController();

  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();
  List<DateTime> currentWeek = [];
  int currentWeekIndex = 0;

  List<List<DateTime>> listOfWeeks = [];

  @override
  void initState() {
    initializeDateFormatting();
    initCalender();
    super.initState();
  }

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  initCalender() {
    // List<DateTime> minus3Days = [];
    // List<DateTime> add3Days = [];
    // for (int index = 0; index < 3; index++) {
    //   DateTime minusDate = today.add(Duration(days: -(index + 1)));
    //   minus3Days.add(minusDate);
    //   DateTime addDate = today.add(Duration(days: (index + 1)));
    //   add3Days.add(addDate);
    // }
    // currentWeek.addAll(minus3Days.reversed.toList());
    // currentWeek.add(today);
    // currentWeek.addAll(add3Days);
    // listOfWeeks.add(currentWeek);

    final date = DateTime.now();

    DateTime startOfCurrentWeek = widget.weekStartFrom == WeekStartFrom.Monday
        ? getDate(date.subtract(Duration(days: date.weekday - 1)))
        : getDate(date.subtract(Duration(days: date.weekday % 7)));

    currentWeek.add(startOfCurrentWeek);
    for (int index = 0; index < 6; index++) {
      DateTime addDate = startOfCurrentWeek.add(Duration(days: (index + 1)));
      currentWeek.add(addDate);
      if (index == 5) {
        startOfCurrentWeek = addDate;
      }
    }
    // listOfWeeks.add(currentWeek);
    // currentWeek.clear();
    // for (int index = 0; index < 6; index++) {
    //   DateTime addDate = startOfCurrentWeek.add(Duration(days: (index + 1)));
    //   currentWeek.add(addDate);
    // }

    listOfWeeks.add(currentWeek);

    // getMorePreviousWeeks();
  }

  getMorePreviousWeeks() {
    List<DateTime> minus7Days = [];
    DateTime startFrom = listOfWeeks.isEmpty
        ? DateTime.now()
        : listOfWeeks[currentWeekIndex].isEmpty
            ? DateTime.now()
            : listOfWeeks[currentWeekIndex][0];

    for (int index = 0; index < 7; index++) {
      DateTime minusDate = startFrom.add(Duration(days: -(index + 1)));
      minus7Days.add(minusDate);
    }
    listOfWeeks.add(minus7Days.reversed.toList());
    setState(() {});
  }

  onDateSelect(DateTime date) {
    setState(() {
      selectedDate = date;
    });
    widget.onDateChange?.call(selectedDate);
  }

  onBackClick() {
    carouselController.nextPage();
  }

  onNextClick() {
    carouselController.previousPage();
  }

  onWeekChange(index) {
    if (currentWeekIndex < index) {
      // on back
    }
    if (currentWeekIndex > index) {
      // on next
    }

    currentWeekIndex = index;
    currentWeek = listOfWeeks[currentWeekIndex];

    if (currentWeekIndex + 1 == listOfWeeks.length) {
      getMorePreviousWeeks();
    }

    widget.onWeekChange?.call(currentWeek);
    setState(() {});
  }

  // =================

  isNextDisabled() {
    return listOfWeeks[currentWeekIndex].last.isBefore(DateTime.now());
  }

  isCurrentYear() {
    return DateFormat('yyyy').format(currentWeek[0]) ==
        DateFormat('yyyy').format(today);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var withOfScreen = MediaQuery.of(context).size.width;

    double boxHeight = withOfScreen / 5.6;

    return currentWeek.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         onBackClick();
              //       },
              //       child: Row(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           Icon(
              //             Icons.arrow_back_ios_new,
              //             size: 17,
              //             color:
              //                 widget.activeNavigatorColor ?? theme.primaryColor,
              //           ),
              //           const SizedBox(
              //             width: 4,
              //           ),
              //           Text(
              //             "Back",
              //             style: theme.textTheme.bodyLarge!.copyWith(
              //               color: widget.activeNavigatorColor ??
              //                   theme.primaryColor,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Text(
              //       isCurrentYear()
              //           ? DateFormat('MMMM').format(
              //               currentWeek[0],
              //             )
              //           : DateFormat('MMMM yyyy').format(
              //               currentWeek[0],
              //             ),
              //       style: theme.textTheme.titleMedium!.copyWith(
              //         fontWeight: FontWeight.bold,
              //         color: widget.monthColor ?? theme.primaryColor,
              //       ),
              //     ),
              //     GestureDetector(
              //       onTap: isNextDisabled()
              //           ? () {
              //               onNextClick();
              //             }
              //           : null,
              //       child: Row(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           Text(
              //             "Next",
              //             style: theme.textTheme.bodyLarge!.copyWith(
              //               color: isNextDisabled()
              //                   ? theme.primaryColor
              //                   : widget.inactiveNavigatorColor ?? Colors.grey,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 4,
              //           ),
              //           Icon(
              //             Icons.arrow_forward_ios,
              //             size: 17,
              //             color: isNextDisabled()
              //                 ? theme.primaryColor
              //                 : widget.inactiveNavigatorColor ?? Colors.grey,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              Text(
                ' شهر ${isCurrentYear() ? DateFormat('MMMM', 'ar').format(
                    currentWeek[0],
                  ) : DateFormat('MMMM yyyy', 'ar').format(
                    currentWeek[0],
                  )}',
                style: theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: widget.monthColor ?? const Color(0xff353535),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              CarouselSlider(
                carouselController: carouselController,
                items: [
                  if (listOfWeeks.isNotEmpty)
                    for (int ind = 0; ind < listOfWeeks.length; ind++)
                      Container(
                        height: boxHeight,
                        width: withOfScreen,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            for (int weekIndex = 0;
                                weekIndex < listOfWeeks[ind].length;
                                weekIndex++)
                              Expanded(
                                child: GestureDetector(
                                  onTap: listOfWeeks[ind][weekIndex]
                                          .isAfter(DateTime.now())
                                      ? () {
                                          onDateSelect(
                                            listOfWeeks[ind][weekIndex],
                                          );
                                        }
                                      : DateFormat('dd-MM-yyyy').format(
                                                  listOfWeeks[ind]
                                                      [weekIndex]) ==
                                              DateFormat('dd-MM-yyyy')
                                                  .format(DateTime.now())
                                          ? () {
                                              onDateSelect(
                                                listOfWeeks[ind][weekIndex],
                                              );
                                            }
                                          : null,
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(horizontal: 3),
                                    // width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: DateFormat('dd-MM-yyyy').format(
                                                  listOfWeeks[ind]
                                                      [weekIndex]) ==
                                              DateFormat('dd-MM-yyyy')
                                                  .format(selectedDate)
                                          ? widget.activeBackgroundColor ??
                                              theme.primaryColor
                                          : listOfWeeks[ind][weekIndex]
                                                  .isBefore(DateTime.now())
                                              ? widget.inactiveBackgroundColor ??
                                                  theme.primaryColor
                                                      .withOpacity(.2)
                                              : widget.disabledBackgroundColor ??
                                                  Colors.grey,
                                      border: (DateFormat('dd-MM-yy').format(
                                                  listOfWeeks[ind]
                                                      [weekIndex]) ==
                                              DateFormat('dd-MM-yy')
                                                  .format(selectedDate))
                                          ? null
                                          : Border.all(
                                              color: Color(0xffD9D9D9),
                                            ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            DateFormat('EEE', 'ar').format(
                                              listOfWeeks[ind][weekIndex],
                                            ),
                                            textAlign: TextAlign.center,
                                            style: theme.textTheme.bodyLarge!
                                                .copyWith(
                                                    color: DateFormat('dd-MM-yyyy').format(
                                                                listOfWeeks[ind]
                                                                    [
                                                                    weekIndex]) ==
                                                            DateFormat('dd-MM-yyyy').format(
                                                                selectedDate)
                                                        ? widget.activeTextColor ??
                                                            Colors.white
                                                        : listOfWeeks[ind][weekIndex].isBefore(
                                                                DateTime.now())
                                                            ? widget.inactiveTextColor ??
                                                                Colors.white
                                                                    .withOpacity(
                                                                        .2)
                                                            : widget.disabledTextColor ??
                                                                Colors.white,
                                                    fontSize: 12.sp),
                                          ),
                                          FittedBox(
                                            child: Text(
                                              // "$weekIndex: ${listOfWeeks[ind][weekIndex] == DateTime.now()}",
                                              "${listOfWeeks[ind][weekIndex].day}",
                                              textAlign: TextAlign.center,
                                              style: theme.textTheme.titleLarge!
                                                  .copyWith(
                                                      color: DateFormat('dd-MM-yyyy').format(listOfWeeks[ind][weekIndex]) ==
                                                              DateFormat('dd-MM-yyyy')
                                                                  .format(
                                                                      selectedDate)
                                                          ? widget.activeTextColor ??
                                                              Colors.white
                                                          : listOfWeeks[ind][weekIndex]
                                                                  .isBefore(
                                                                      DateTime
                                                                          .now())
                                                              ? widget.inactiveTextColor ??
                                                                  Colors.white
                                                                      .withOpacity(
                                                                          .2)
                                                              : widget.disabledTextColor ??
                                                                  Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                ],
                options: CarouselOptions(
                  scrollPhysics: const ClampingScrollPhysics(),
                  height: boxHeight,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  reverse: true,
                  onPageChanged: (index, reason) {
                    onWeekChange(index);
                  },
                ),
              ),
            ],
          );
  }
}
