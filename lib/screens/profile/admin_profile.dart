import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:graduation_project/screens/adminUpdateProfile.dart';
import 'package:graduation_project/screens/home/admin_main.dart';
import 'package:graduation_project/screens/profile/ProfileScreen.dart';
import 'package:graduation_project/screens/profile/cubit/profile_cubit.dart';
import 'package:graduation_project/screens/profile/cubit/profile_state.dart';
import 'package:graduation_project/shared/components/constants.dart';

class MainAdminProfile extends StatelessWidget {
  const MainAdminProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: BlocProvider.value(
              value: profileAdminCubit,
              child: BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                },
                builder: (context, state) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.blue.shade900,
                      automaticallyImplyLeading: false,
                      flexibleSpace: SafeArea(
                          child: Container(
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
                            padding: EdgeInsets.only(right: 5.0),
                            child: Text(
                              'الصفحة الشخصية',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 45.0),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 2, bottom: 2),
                              height: 38,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.black12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  const Text(
                                    "تعديل",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AdminUpdateProfile()));
                                    },
                                    icon: const Icon(Icons.edit,
                                        color: Colors.black, size: 20),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                      )),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:ownerModel!=null&&labModel!=null? ListView(
                        children: [
                          Center(
                            heightFactor: 1.3,
                            child: Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 4, color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                ],
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/account.png'),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Column(
                            children: [
                              BuildTextField(
                                  'الاسم بالكامل', ownerModel!.name),
                              BuildTextField('البريد الالكتروني',
                                  ownerModel!.email),
                              BuildTextField('كلمة السر', '**********'),
                              BuildTextField('الموقع', ownerModel!.address),
                            ],
                          ),
                          buildLabData(),
                        ],
                      )
                          :const Center(child: CircularProgressIndicator()),
                    ),
                    bottomNavigationBar: SafeArea(
                      child: Container(
                        decoration: BoxDecoration(color: Colors.blue.shade900),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 4),
                          child: GNav(
                            color: Colors.white,
                            activeColor: Colors.grey.shade50,
                            hoverColor: Colors.grey.shade50,
                            padding: const EdgeInsets.all(16),
                            tabs: [
                              GButton(
                                margin: EdgeInsetsDirectional.only(start:MediaQuery.of(context).size.width*.2),
                                iconSize: 28,
                                icon: Icons.home,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  AdminMain()),
                                  );
                                },
                              ),
                              GButton(
                                margin: EdgeInsetsDirectional.only(end:MediaQuery.of(context).size.width*.2),
                                iconSize: 28,
                                icon: Icons.person,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MainAdminProfile()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }

  Widget buildLabData()=>BlocBuilder<ProfileCubit, ProfileState>(
  builder: (context, state) {
    return Column(
    children: [
      Center(
        heightFactor: 1.3,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border:
            Border.all(width: 4, color: Colors.white),
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 10,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
            shape: BoxShape.circle,
            image:  DecorationImage(
              image:
              NetworkImage(labModel!.labImage,),
              fit: BoxFit.cover
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      BuildTextField(
          'اسم المعمل', labModel!.labName),
      BuildTextField('البريد الالكتروني',
          labModel!.labPhone),
      BuildTextField('الموقع', labModel!.labAddress),
    ],
  );
  },
);
  Widget BuildTextField(String text, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 30,
      ),
      child: ListTile(
        title: Container(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(text),
        ),
        trailing: Container(
          height: 70,
          width: 230,
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(15)),
          child: Center(child: Text(placeholder)),
        ),
      ),
    );
  }
}
