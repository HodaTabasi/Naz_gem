import 'package:flutter/material.dart';
import 'package:naz_gem/features/bill/ui/pages/my_billes.dart';
import 'package:naz_gem/features/booking/ui/pages/booking_screen.dart';
import 'package:naz_gem/features/home/ui/pages/home_screen.dart';
import 'package:naz_gem/features/more/ui/pages/more_page.dart';
import 'package:naz_gem/features/subscrbtions/ui/pages/subscrbtion_screen.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPaheState();
}

class _BottomNavigationPaheState extends State<BottomNavigationPage> {
  List<Widget> pages =[
    HomeScreen(),
    Subscrbtions(),
    BookingScreen(),
    MyBilles(),
    MorePage()
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
    );
  }
}
