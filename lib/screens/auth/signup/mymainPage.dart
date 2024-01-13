import 'package:flutter/material.dart';
import 'package:graduation_project/screens/auth/login/adminLogin.dart';
import 'package:graduation_project/screens/auth/signup/labowner.dart';
import 'package:graduation_project/screens/home/HomePage.dart';
import 'package:graduation_project/screens/auth/login/login.dart';
import 'package:graduation_project/screens/home/cubit/home_patint_cubit.dart';
import 'package:graduation_project/widgets/Home/home_body.dart';
import 'package:graduation_project/widgets/admin/navigation.dart';
import 'package:graduation_project/widgets/admin/myButton.dart';

class MyMain extends StatelessWidget {
  const MyMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 240, 248),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 220, bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyAdminButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const LoginAsAdmin();
                          },
                        ),
                      );
                    },
                    color: Colors.blue.shade900,
                    text: const Text(
                      'أدمن',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Archivo',
                          fontSize: 20),
                    ),
                  ),
                  MyAdminButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return   OwnerRegister();
                          },
                        ),
                      );
                    },
                    color: Colors.blue.shade900,
                    text: const Text(
                      'تمتلك معمل ؟',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Archivo',
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Image(
                        height: 150,
                        width: 150,
                        image: AssetImage(
                            'assets/images/microscope.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 8.0),
                      child: Text(
                        ' مجمّع معامل بنها بين يديك الآن ',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Archivo',
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        ' سارع بتسجيل الدخول او تصفح المعامل',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Archivo',
                            color: Colors.blue.shade600),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 90,
                      child: BigButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const Login();
                              },
                            ),
                          );
                        },
                        color: Colors.blue.shade900,
                        //المفروض مكانها تكست
                        text: const Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Archivo',
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: 90,
                      child: BigButton(
                        onTap: () {
                          homePatientCubit =HomeCubit();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const HomePage();
                              },
                            ),
                          );
                        },
                        color: Colors.blue.shade900,
                        //المفروض مكانها تكست
                        text: const Text(
                          'تصفح',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Archivo',
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
