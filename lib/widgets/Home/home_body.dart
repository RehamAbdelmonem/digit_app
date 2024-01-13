import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/owner_model.dart';
import 'package:graduation_project/models/test.dart';
import 'package:graduation_project/models/user.dart';
import 'package:graduation_project/screens/DetailsLaboratories.dart';
import 'package:graduation_project/screens/chats/chats_screen.dart';
import 'package:graduation_project/screens/home/HomePage.dart';
import 'package:graduation_project/screens/home/cubit/home_patient_states.dart';
import 'package:graduation_project/screens/home/cubit/home_patint_cubit.dart';
import 'dart:async';
import 'package:graduation_project/screens/lab/Laboratories.dart';
import 'package:graduation_project/screens/profile/ProfileScreen.dart';
import 'package:graduation_project/screens/lab/Radiology.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:graduation_project/screens/chatPageUser.dart';
import 'package:graduation_project/screens/profile/cubit/profile_cubit.dart';
import 'package:graduation_project/widgets/Home/Labs.dart';

import '../../screens/auth/signup/mymainPage.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cache_helper.dart';

HomeCubit homePatientCubit = HomeCubit();

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int _currentIndex = 0;

  final List<String> _imageList = [
    'images/doctor.jpg',
    'images/Anim1.jpg',
    'images/Anim2.jpg',
    'images/Anim3.jpg',
    'images/Anim4.jpg',
  ];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _imageList.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 70.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )),
                  ),
                  MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) =>
                        profileCubit..getPatientProfileData(),
                        lazy: false,
                      ),
                      BlocProvider(
                        create: (context) => homePatientCubit..getLab(),
                      ),
                    ],
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5),
                          child: Container(
                            height: 200,
                            width: 500,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30.0)),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/${_imageList[_currentIndex]}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 190,
                                margin: const EdgeInsets.only(
                                    right: 5.0, top: 30.0),
                                // padding: EdgeInsets.all(10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Laboratories(),
                                      ),
                                    );
                                  },
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          "assets/images/lab.jpg",
                                          height: 250,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: const Text(
                                          "معامل تحاليل ",
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 190,
                                margin: const EdgeInsets.only(
                                    right: 5.0, top: 30.0),
                                // padding: EdgeInsets.all(10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Radiology(),
                                      ),
                                    );
                                  },
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          "assets/images/radiology.jpg",
                                          height: 250,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "مراكز أشعة",
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        BlocBuilder<HomeCubit, HomePatientStates>(
                          builder: (context, state) {
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                height: 150,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      HomeCubit.get(context).labs.length,
                                  itemBuilder: (context, index) => Labs(
                                    lab: HomeCubit.get(context)
                                        .labs[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: myId != null
          ? Container(
              decoration: BoxDecoration(color: Colors.blue.shade900),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: GNav(
                  color: Colors.white,
                  activeColor: Colors.grey.shade50,
                  hoverColor: Colors.grey.shade50,
                  gap: 8,
                  padding: const EdgeInsets.all(16),
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                    ),
                    GButton(
                      icon: Icons.person,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProfileScreen(user: Users[0])),
                        );
                      },
                    ),
                    GButton(
                      icon: Icons.message,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatsScreen()),
                        );
                      },
                    ),
                    GButton(
                      icon: Icons.logout,
                      onPressed: () {
                        CacheHelper.clear();
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
              ),
            )
          : null,
    );
  }
}

//Rehaaaaaaaaaam
