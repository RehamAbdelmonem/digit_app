import 'package:flutter/material.dart';

import 'package:graduation_project/screens/home/admin_main.dart';
import 'package:graduation_project/screens/profile/admin_profile.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController pageController = PageController();
  List<Widget> Pages = [
     AdminMain(),
    const MainAdminProfile(),
  ];
  int selectedIndex = 0;
  void onPageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onItemTap(int selectedItem) {
    pageController.jumpToPage(selectedItem);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: PageView(
              controller: pageController,
              children: Pages,
              onPageChanged: onPageChanged,
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.black87,
              unselectedItemColor: Colors.grey.shade600,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color.fromARGB(255, 207, 226, 239),
              onTap: onItemTap,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home,
                      color: selectedIndex == 0 ? Colors.black : Colors.grey),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person,
                      color: selectedIndex == 1 ? Colors.black : Colors.grey),
                  label: 'الصفحة الشخصية',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
