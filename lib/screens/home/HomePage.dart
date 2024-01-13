import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/Home/home_body.dart';

import '../../widgets/drawer/menu_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: RadiologyAppBar(),
      drawer: drawerMenu(context),
      body: const HomeBody(),
    );
  }

  AppBar RadiologyAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text("الصفحة الرئيسية"),
      centerTitle: false,
      backgroundColor: Colors.blue.shade900,
      
    );
  }

}







//Rehaaaaaaaaaam

//HomePage 
// appbar(الصفحة الرئيسية) => (دي شاشة اللي فيها بيختار المستخم اشعة ولا تحاليل)


//(///////  No backend required for this screen  ////////)

//1) widget folder name => Home (home_body,Labs)
//$) home_body => is Ui of homePage
//$$) Labs => is class to represent Container of (معامل التحاليل و مركز الأشعة ) of homePage


