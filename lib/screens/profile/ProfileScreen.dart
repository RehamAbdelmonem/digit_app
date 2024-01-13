import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/user.dart';
import 'package:graduation_project/screens/HelpScreen.dart';
import 'package:graduation_project/screens/MedicalRecord.dart';
import 'package:graduation_project/screens/profile/PersonalInfo.dart';
import 'package:graduation_project/screens/SettingScreen.dart';
import 'package:graduation_project/screens/profile/UpdateProfileScreen.dart';
import 'package:graduation_project/screens/profile/cubit/profile_cubit.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../shared/network/local/cache_helper.dart';
import '../auth/signup/mymainPage.dart';
import 'cubit/profile_state.dart';


ProfileCubit profileCubit=ProfileCubit();
class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          'الصفحة الشخصية',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              BlocProvider.value(
                value:  profileCubit,
                child: BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return patientModel!=null? Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: patientModel!.image!=null? CachedNetworkImage(
                                    placeholder:(context, url) =>  const CircularProgressIndicator(),
                                    imageUrl: patientModel!.image!,
                                    errorWidget:(context, url, error) =>  const Image(image: AssetImage('assets/images/ProfileImage.png'),
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,),
                                  ):const Image(image: AssetImage('assets/images/ProfileImage.png')),

                            ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          patientModel!.name,
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ):const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                             const UpdateProfileScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade900,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    'تعديل البيانات',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(height: 10),

              //menu
              ProfileMenuWidget(
                title: "المعلومات الشخصية",
                icon: LineAwesomeIcons.user_check,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PersonalInfo(
                            user: Users[0],
                          ),
                    ),
                  );
                },
                textColor: Colors.blue.shade900,
              ),
              ProfileMenuWidget(
                title: "السجل الطبي",
                icon: LineAwesomeIcons.medical_notes,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MedicalRecord(),
                    ),
                  );
                },
                textColor: Colors.blue.shade900,
              ),

              ProfileMenuWidget(
                title: "المساعدة",
                icon: LineAwesomeIcons.question_circle,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpScreen(),
                    ),
                  );
                },
                textColor: Colors.blue.shade900,
              ),
              ProfileMenuWidget(
                title: "الإعدادات",
                icon: LineAwesomeIcons.cog,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
                textColor: Colors.blue.shade900,
              ),
              ProfileMenuWidget(
                title: "تسجيل الخروج",
                icon: LineAwesomeIcons.alternate_sign_out,
                onPress: () {
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
                textColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.black.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: Colors.blue.shade900,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20).apply(color: textColor),
      ),
      trailing: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.black.withOpacity(0.1),
        ),
        child: const Icon(
          LineAwesomeIcons.angle_left,
          color: Colors.grey,
        ),
      ),
    );
  }
}


//Rehaaaaaaaaaam


//ProfileScreen 
//appbar( الصفحة الشخصية) => دي شاشة بتعرض بروفايل اليوزر 


// (///////  Backend needed for this screen  ////////)
//1) المفروض الاسم دا يجي من الداتا 
//  او بمعنى اصح فيه مودل اسمه يوزر دا اللي فيه بياناته

//2)  Activate Logout (فيه تسجيل خروج تانية في الداش بورد متنسوهاش)

//3) model name => user => ( دا اللي فيه كل بيانات اليوزر  )
