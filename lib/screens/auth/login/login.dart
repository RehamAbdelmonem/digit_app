import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/components/componants.dart';
import 'package:graduation_project/screens/home/HomePage.dart';
import 'package:graduation_project/screens/auth/login/cubit/login_cubit.dart';
import 'package:graduation_project/screens/auth/login/cubit/login_states.dart';
import 'package:graduation_project/screens/auth/signup/signup.dart';
import 'package:graduation_project/screens/profile/ProfileScreen.dart';
import 'package:graduation_project/screens/profile/cubit/profile_cubit.dart';

import 'package:graduation_project/widgets/admin/navigation.dart';

import '../../../widgets/Home/home_body.dart';
import '../../home/cubit/home_patint_cubit.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                title: const Text(
                  '',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                backgroundColor: Colors.blue[900],
              ),
              body: Center(
                child: ListView(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  children: [
                    Form(
                      key: formState,
                      child:
                      //Hello Admin
                      Center(
                        child: Column(children: [
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsetsDirectional.all(16),
                                margin: const EdgeInsetsDirectional.only(
                                    top: 45),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue.shade900,
                                ),
                                child: const Icon(
                                  Icons.perm_identity,
                                  size: 100,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              const Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Archivo',
                                  fontSize: 32,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 50),

                          //email text field
                          Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'البريد الالكتروني',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                                ),
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                validator: ((value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field is required';
                                  }

                                  if (!RegExp(r'^[أ-ى]|\w|\s+$')
                                      .hasMatch(value)) {
                                    return "Please enter a valid  name";
                                  }

                                  // the email is valid
                                  return null;
                                }),

                              ),
                              const SizedBox(height: 25,),
                            ],
                          ),
                          //login in button
                          BlocProvider(
                            create: (context) => LoginCubit(),
                            child: BlocConsumer<LoginCubit, LoginStates>(
                              listener: (context, state) {
                                if(state is SuccessesLoginState){
                                  profileCubit = ProfileCubit();
                                  homePatientCubit = HomeCubit();
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (
                                          BuildContext context) {
                                        return const HomePage();
                                      },
                                    ),
                                    (route) => false,
                                  );
                                }
                              },
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Center(
                                          child: TextFormField(
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              hintText: 'كلمة المرور',
                                              suffixIcon: togglePassword(),
                                              border: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black,
                                                      width: 1),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(10))),
                                            ),
                                            controller: password,

                                            obscureText: isSecurePassword,
                                            validator: ((value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'This field is required';
                                              }

                                              if (!RegExp(r'^[أ-ى]|\w|\s+$')
                                                  .hasMatch(value)) {
                                                return "Please enter a valid  password";
                                              }

                                              return null;
                                            }),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: condition(
                                        condition: state is!LoadingLoginState,
                                        child: BigButton(
                                          color: Colors.blue.shade900,
                                          onTap: () {
                                            if (formState.currentState!
                                                .validate()) {
                                              LoginCubit.get(context).login(
                                                  email: email.text,
                                                  password: password.text,
                                                isPatient: true,
                                              );
                                            }
                                          },
                                          text: const Text(
                                            'دخول',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Archivo',
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'ليس لديك حساب بعد؟',
                                style: TextStyle(fontSize: 16),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return const SignUP();
                                      },
                                    ),
                                  );
                                },
                                child: const Text(
                                  'اشترك الآن',
                                  style:
                                  TextStyle(color: Colors.blue, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          isSecurePassword = !isSecurePassword;
        });
      },
      icon: isSecurePassword
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
}
