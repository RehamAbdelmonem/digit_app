import 'package:flutter/material.dart';

import 'package:graduation_project/widgets/radiology/radioloy_body.dart';

import '../../widgets/drawer/menu_drawer.dart';

class Radiology extends StatelessWidget {
  const Radiology({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: RadiologyAppBar(),
      drawer: drawerMenu(context),
      body: const RadiologyBody(),
    );
  }

  AppBar RadiologyAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text("مراكز الأشعة "),
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
                  builder: (context) => ProfileScreen(
                    user: Users[0],
                  ),
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
  }
*/
}







//Rehaaaaaaaaaam

//Radiology 
//appbar(مراكز الأشعة  ) => (قايمة مراكز الأشعة التحاليل)


// (///////  Backend needed for this screen  ////////)
//1) المفروض تبقا البيانات اللي ظاهرة قصاد كل معمل زي الاسم تيجي من الداتا
//2) تاني حاجة تفعلوا السيرش 


//1) widget folder name => radiology (radioloy_body,radiology_center)
//$) radioloy_body => is Ui of List of Radiology
//$$) radiology_center => is class for (البيانات زي اسم المعمل) of Radiology


//2) model name => scan => ( دا اللي فيه كل بيانات المعمل  )