import 'package:flutter/material.dart';
import 'package:graduation_project/models/admin/prof.dart';

import 'package:graduation_project/screens/home/admin_main.dart';
import 'package:graduation_project/widgets/admin/profileWidget.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  int currentPage = 0;

  List<profiliy> profile = [
    profiliy(
        name: 'رضوي جمال محمد',
        age: '21',
        email: 'admin@gmail.com',
        phone: '01093395099',
        image: 'assets/images/icons8-edit-account-100 .png',
        location: 'location',
        password: '************')
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue.shade900,
              automaticallyImplyLeading: false,
              flexibleSpace: SafeArea(
                  child: Row(children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  ////////////////لو احط ارو بيرجع
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 75.0),
                  child: Text(
                    'الصفحة الشخصية',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ])),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, right: 15),
                    child: ListView.builder(
                        itemCount: profile.length,
                        itemBuilder: ((context, index) {
                          return Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4, color: Colors.white),
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/account.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                ///////////////////////////////
                                Expanded(
                                  child: ProfileWidget(
                                    name: profile[index].name,
                                    email: profile[index].email,
                                    password: profile[index].password,
                                    location: profile[index].location,
                                  ),
                                ),
                              ],
                            ),
                          );
                        })),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
