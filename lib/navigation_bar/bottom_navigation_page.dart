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
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // _pageController = PageController();
  }

  @override
  void dispose() {
    // _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      // body : SizedBox.expand(
      //   child: PageView(
      //     controller: _pageController,
      //     onPageChanged: onChangedTab,
      //     children: pages,
      //     physics: const NeverScrollableScrollPhysics(),
      //   ),
      // ),
      bottomNavigationBar: TabBarMaterialWidget(
        index: index,
        onChangedTab: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: SvgPicture.asset('assets/images/bottom_images/calendar.svg'),
        onPressed: () => _onItemTapped(2),//onChangedTab(2),
        backgroundColor: btnColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  void _onItemTapped(int ind) {
    setState(() {
      index = ind;
      //
      //
      //using this page controller you can make beautiful animation effects
      // _pageController.animateToPage(index,
      //     duration: Duration(milliseconds: 300), curve: Curves.linear);
    });
  }
}
