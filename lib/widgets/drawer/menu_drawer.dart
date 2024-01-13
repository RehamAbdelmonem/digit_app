import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/chats/chats_screen.dart';
import 'package:graduation_project/screens/home/HomePage.dart';
import 'package:graduation_project/shared/network/local/cache_helper.dart';

import '../../models/user.dart';
import '../../screens/HelpScreen.dart';
import '../../screens/profile/ProfileScreen.dart';
import '../../screens/SettingScreen.dart';
import '../../screens/admin_serv_offers.dart';
import '../../screens/chatPageUser.dart';
import '../../screens/auth/signup/mymainPage.dart';
import '../../shared/components/constants.dart';

Drawer drawerMenu(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 100,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
            ),
            child: const Text(
              'لوحة التحكم',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        ListTile(
          title: const Text(
            'الصفحة الرئيسية',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        ),
        if (myId != null)
          ListTile(
            title: const Text(
              'الملف الشخصي',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(user: Users[0]),
                ),
              );
            },
          ),
        if (myId == null)
          ListTile(
            title: const Text(
              'تسجبل الدخول',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyMain(),
                ),
              );
            },
          ),
        if (myId != null)
          ListTile(
            title: const Text(
              'الرسائل',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatsScreen(),
                ),
              );
            },
          ),
        ListTile(
          title: const Text(
            'الخدمات و العروض',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyServOffers(),
              ),
            );
          },
        ),
        if (myId != null)
          ListTile(
            title: const Text(
              'الإعدادات ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ListTile(
          title: const Text(
            'المساعدة ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HelpScreen(),
              ),
            );
          },
        ),
        if (myId != null)
          ListTile(
            title: const Text(
              'تسجيل الخروج ',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
            onTap: () async {
              CacheHelper.clear();
             await FirebaseAuth.instance.signOut();
              myId = null;
              patientModel = null;
              ownerModel = null;
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyMain(),
                  ),
              (route) => false,);
            },
          ),
      ],
    ),
  );
}
