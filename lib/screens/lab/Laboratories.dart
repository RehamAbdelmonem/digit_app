import 'package:flutter/material.dart';
import 'package:graduation_project/models/user.dart';
import 'package:graduation_project/screens/HelpScreen.dart';
import 'package:graduation_project/screens/home/HomePage.dart';
import 'package:graduation_project/screens/profile/ProfileScreen.dart';
import 'package:graduation_project/screens/SettingScreen.dart';
import 'package:graduation_project/screens/admin_serv_offers.dart';
import 'package:graduation_project/widgets/Laboratories/laboratories_body.dart';
import 'package:graduation_project/screens/chatPageUser.dart';

import '../../widgets/drawer/menu_drawer.dart';

class Laboratories extends StatelessWidget {
  const Laboratories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: laboratoryAppBar(context),
      drawer: drawerMenu(context),
      body: const LaoratoriesBody(),
    );
  }

  AppBar laboratoryAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Text("معامل التحاليل "),
      centerTitle: false,
      backgroundColor: Colors.blue.shade900,
    );
  }
/*
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
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
                  builder: (context) => ChatPageUser(),
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
          ListTile(
            title: const Text(
              'تسجيل الخروج ',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }*/
}








//Rehaaaaaaaaaam


//Laboratories 
//appbar(معامل التحاليل) => (قايمة معامل التحاليل)


// (///////  Backend needed for this screen  ////////)
//1) المفروض تبقا البيانات اللي ظاهرة قصاد كل معمل زي الاسم تيجي من الداتا
//2) تاني حاجة تفعلوا السيرش 


//1) widget folder name => Laboratories (laboratories_body,laboratories_test)
//$) laboratories_body => is Ui of List of Laboratories
//$$) laboratories_test => is class for (البيانات زي اسم المعمل) of Laboratories


//2) model name => test => ( دا اللي فيه كل بيانات المعمل  )