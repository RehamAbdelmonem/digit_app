import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:graduation_project/screens/adminUpdateProfile.dart';
import 'package:graduation_project/screens/admin_offers.dart';
import 'package:graduation_project/screens/chats/chats_screen.dart';
import 'package:graduation_project/screens/home/cubit/home_patint_cubit.dart';
import 'package:graduation_project/screens/profile/admin_profile.dart';

import 'package:graduation_project/screens/admin_services.dart';
import 'package:graduation_project/screens/chatpage.dart';
import 'package:graduation_project/screens/medicalreport.dart';
import 'package:graduation_project/screens/newOffer.dart';
import 'package:graduation_project/screens/profile/cubit/profile_cubit.dart';
import 'package:graduation_project/screens/profile/cubit/profile_state.dart';
import 'package:graduation_project/screens/reports/reportMain.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/shared/network/local/cache_helper.dart';
import 'package:graduation_project/widgets/Home/home_body.dart';

import 'package:graduation_project/widgets/admin/categorywidget.dart';
import 'package:graduation_project/widgets/admin/myButton.dart';
import 'package:graduation_project/screens/admin_serv_offers.dart';
import '../appointment.dart';
import '../auth/signup/mymainPage.dart';
import '../notification_page.dart';
import 'package:graduation_project/widgets/admin/searchfield.dart';

import '../profile/ProfileScreen.dart';
//import 'package:myfirst/Pages/startPage.dart';

HomeCubit homeOwnerCubit = HomeCubit();
ProfileCubit profileAdminCubit = ProfileCubit();

class AdminMain extends StatelessWidget {
  AdminMain({Key? key}) : super(key: key);

  int currentPage = 0;

  //var bottomNavigationBar = BottomNavigationbar();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = Colors.blue.shade900;
    const iconcolor = Colors.white;
    const textcolor = Colors.white;
    //final double height = MediaQuery.of(context).size.height;
    //final double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider.value(
        value: profileAdminCubit..getOwnerProfileData(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue.shade900,
          ),
          drawer: NaviationDrawer(),
          backgroundColor: Colors.blue.shade50,
          body: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return ownerModel != null && labModel != null
                  ? ListView(
                children: [
                  Container(
                    // margin: const EdgeInsets.only(left: 9.0, right: 9.0),
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            bottomRight: Radius.circular(45))),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Text(
                                'مرحبا ${ownerModel!.name}',
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                ownerModel!.phone,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue.shade100,
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    labModel!.labAddress,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue.shade100,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                 
                  const SizedBox(
                    height: 50,
                  ),
                  //Pages_part color: Colors.brown.shade50, green.shade200,
                  Column(
                    children: [
                      //Messages
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Category(
                                // text: 'Appointments',
                                color: Colors.blue.shade50,
                                image:
                                "assets/images/schedule.png",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (BuildContext context) {
                                        return const AppointPage();
                                      },
                                    ),
                                  );
                                },
                              ),
                              const Text('المواعيد'),
                            ],
                          ),
                          //Appoint_requests
                          Column(
                            children: [
                              Category(
                                //text: 'messages',
                                color: Colors.blue.shade50,
                                image:
                                "assets/images/message.png",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (BuildContext context) {
                                        return ChatsScreen();
                                      },
                                    ),
                                  );
                                },
                              ),
                              const Text('الرسائل'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      //home serv Requests
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Category(
                                //text: 'home services',
                                color: Colors.blue.shade50,
                                image:
                                "assets/images/business-report.png",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (BuildContext context) {
                                        return const ReportPage();
                                      },
                                    ),
                                  );
                                },
                              ),
                              const Text('التقارير'),
                            ],
                          ),

                          //offers manage
                          Column(
                            children: [
                              Category(
                                //text: 'offers',
                                color: Colors.blue.shade50,
                                image:
                                "assets/images/off.png",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (BuildContext context) {
                                        return const Myoffers();
                                      },
                                    ),
                                  );
                                },
                              ),
                              const Text('العروض'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                    ],
                  ),

                  // ignore: avoid_unnecessary_containers
                ],
              )
                  : const Center(child: CircularProgressIndicator());
            },
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(color: Colors.blue.shade900),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: GNav(
                color: Colors.white,
                activeColor: Colors.grey.shade50,
                hoverColor: Colors.grey.shade50,
                padding: const EdgeInsets.all(16),
                tabs: [
                  GButton(
                    iconSize: 28,
                    icon: Icons.home,
                    margin: EdgeInsetsDirectional.only(
                        start: MediaQuery.of(context).size.width * .2),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminMain()),
                      );
                    },
                  ),
                  GButton(
                    iconSize: 28,
                    icon: Icons.person,
                    margin: EdgeInsetsDirectional.only(
                        end: MediaQuery.of(context).size.width * .2),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainAdminProfile()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          //
        ),
      ),
    );
  }
}

class NaviationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: const Color.fromARGB(255, 207, 226, 239),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildHearder(context),
                buildMenuItem(context),
              ]),
        ),
      );

  Widget buildHearder(BuildContext context) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );

  Widget buildMenuItem(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined, color: Colors.black45),
              title: const Text(
                'الرئيسية',
                style: TextStyle(color: Colors.black45),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AdminMain(),
              )),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline, color: Colors.black45),
              title: const Text(
                'تعديل الملف الشخصي',
                style: TextStyle(color: Colors.black45),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AdminUpdateProfile(),
              )),
            ),
            ListTile(
              leading: const Icon(Icons.auto_awesome, color: Colors.black45),
              title: const Text(
                'إضافة عروض',
                style: TextStyle(color: Colors.black45),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddNewOffer(),
              )),
            ),
            // ListTile(
            //   leading: const Icon(Icons.auto_awesome, color: Colors.black45),
            //   title: const Text(
            //     'إضافة خدمات',
            //     style: TextStyle(color: Colors.black45),
            //   ),
            //   onTap: () => Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => const AddNewService(),
            //   )),
            // ),

            ListTile(
              leading: const Icon(Icons.article, color: Colors.black45),
              title: const Text(
                'التقارير',
                style: TextStyle(color: Colors.black45),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ReportPage(),
              )),
            ),
            const Divider(
              color: Colors.black54,
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black45),
              title: const Text(
                'تسجيل خروج',
                style: TextStyle(color: Colors.black45),
              ),
              onTap: () {
                myId = null;
                labModel = null;
                ownerModel = null;
                patientModel = null;
                CacheHelper.clear();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyMain(),
                    ),
                    (route) => false);
              },
            ),
          ],
        ),
      );
}
