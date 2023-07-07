import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naz_gem/core/constants/app_colors.dart';
import 'package:naz_gem/features/bill/ui/pages/my_billes.dart';
import 'package:naz_gem/features/booking/ui/pages/booking_screen.dart';
import 'package:naz_gem/features/home/ui/pages/home_screen.dart';
import 'package:naz_gem/features/more/ui/pages/more_page.dart';
import 'package:naz_gem/features/profile/ui/pages/profile.dart';
import 'package:naz_gem/features/subscrbtions/ui/pages/subscrbtion_screen.dart';

import 'TabBarMaterialWidget.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPaheState();
}

class _BottomNavigationPaheState extends State<BottomNavigationPage> {
  List<Widget> pages = [
    HomeScreen(),
    MyBilles(),
    BookingScreen(),
    ProfileScreen(),
    MorePage()
  ];

  int index = 0;

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: pages[index],
        bottomNavigationBar: TabBarMaterialWidget(
          index: index,
          onChangedTab: onChangedTab,
        ),
        floatingActionButton: FloatingActionButton(
          child: SvgPicture.asset('assets/images/bottom_images/calendar.svg'),
          onPressed: ()=>onChangedTab(2),
          backgroundColor: btnColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    }
  }
