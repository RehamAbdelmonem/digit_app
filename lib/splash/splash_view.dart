import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/screens/auth/signup/mymainPage.dart';
import 'package:graduation_project/screens/home/HomePage.dart';
import 'package:graduation_project/screens/home/admin_main.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/shared/network/local/cache_helper.dart';

import '../screens/onboarding/screens/onboarding/screen_one.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {




  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      myId = await CacheHelper.getData(key: "myId");
      String? role = await CacheHelper.getData(key: "role");
      if (myId != null && role != null) {
        print("========$role===========$myId===============");
        if (role == "owner") {
          Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) =>  AdminMain(),),
                (route) => false,);
        }
        else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
        }
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  OnboardingScreenOne(),
            ));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(child: Image.asset("assets/images/logo.png")),
    );
  }
}
