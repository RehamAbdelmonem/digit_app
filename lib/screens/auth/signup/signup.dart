import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/components/componants.dart';
import 'package:graduation_project/screens/auth/login/login.dart';
import 'package:graduation_project/screens/auth/signup/register_cubit/register_cubit.dart';
import 'package:graduation_project/screens/auth/signup/register_cubit/register_states.dart';
import 'package:graduation_project/screens/success.dart';
import 'package:graduation_project/widgets/admin/customtextform.dart';
import 'package:graduation_project/widgets/admin/navigation.dart';

import '../../../models/patientModel.dart';
import '../../../shared/components/constants.dart';
import '../../../widgets/Home/home_body.dart';
import '../../home/cubit/home_patint_cubit.dart';
import '../../profile/ProfileScreen.dart';
import '../../profile/cubit/profile_cubit.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  var formKey = GlobalKey<FormState>();
  bool isSecurePassword = true;

  TextEditingController userName = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController ssn = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordconfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                backgroundColor: Colors.blue.shade900,
              ),
              body: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Column(
                          children: [
                            Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: height * 0.04,
                                  ),
                                  Container(
                                    padding: const EdgeInsetsDirectional.all(8),
                                    margin: const EdgeInsetsDirectional.only(
                                        top: 15),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue.shade900,
                                    ),
                                    child: const Icon(
                                      Icons.perm_identity,
                                      size: 80,
                                      color: Colors.white,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Center(
                                    child: Text(
                                      'تسجيل الاشتراك',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Archivo',
                                        fontSize: 28,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 25),

                                  //email text field
                                  Column(
                                    children: [
                                      /////////////////////////////////////////
                                      CusTextForm(
                                        hint: 'اسم المستخدم',
                                        myController: userName,
                                        keyboardType: TextInputType.name,
                                        valid: ((value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This field is required';
                                          }

                                          if (!RegExp(r'^[a-z A-z أ-ي]+$')
                                              .hasMatch(value)) {
                                            return "Please enter a valid  name";
                                          }

                                          // the email is valid
                                          return null;
                                        }),
                                      ),
                                      CusTextForm(
                                        hint: 'السن',
                                        //   keyboardType: TextInputType.number,
                                        myController: age,
                                        keyboardType: TextInputType.number,
                                        valid: ((value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This field is required';
                                          }

                                          if (!RegExp(r'^[\d]{2}$')
                                              .hasMatch(value)) {
                                            return "Please enter a valid  age";
                                          }

                                          // the email is valid
                                          return null;
                                        }),
                                      ),
                                      CusTextForm(
                                        hint: 'البريد الإلكتروني',
                                        myController: email,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        valid: ((value) {
                                          // Check if this field is empty
                                          if (value == null || value.isEmpty) {
                                            return 'This field is required';
                                          }

                                          // using regular expression
                                          if (!RegExp(r'\S+@\S+\.\S+')
                                              .hasMatch(value)) {
                                            return "Please enter a valid email address";
                                          }

                                          // the email is valid
                                          return null;
                                        }),
                                      ),
                                      CusTextForm(
                                        hint: 'الرقم القومي',
                                        myController: ssn,
                                        keyboardType: TextInputType.number,
                                        valid: ((value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This field is required';
                                          }

                                          if (!RegExp(r'^(\d){14}$')
                                              .hasMatch(value)) {
                                            return "Please enter a valid  ssn";
                                          }

                                          // the email is valid
                                          return null;
                                        }),
                                      ),
                                      CusTextForm(
                                        hint: 'الهاتف',
                                        myController: phone,
                                        keyboardType: TextInputType.number,
                                        valid: ((value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This field is required';
                                          }

                                          if (!RegExp(r'^[0-9]{11}$')
                                              .hasMatch(value)) {
                                            return "Please enter a valid  phone number";
                                          }

                                          // the email is valid
                                          return null;
                                        }),
                                      ),
                                      CusTextForm(
                                        hint: 'عنوان الإقامة',
                                        myController: address,
                                        keyboardType:
                                            TextInputType.streetAddress,
                                        valid: ((value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This field is required';
                                          }

                                          if (!RegExp(r'^[أ-ي A-z a-z]+$')
                                              .hasMatch(value)) {
                                            return "Please enter a valid  address";
                                          }

                                          // the email is valid
                                          return null;
                                        }),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          hintText: 'كلمة السر',
                                          suffixIcon: togglePassword(),
                                          border: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        ),
                                        controller: password,
                                        obscureText: isSecurePassword,
                                        validator: ((value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This field is required';
                                          }

                                          // if (!RegExp(r'^[أ-ى]|\w|\s+$')
                                          //     .hasMatch(value)) {
                                          //   return "Please enter a valid  password";
                                          // }

                                          return null;
                                        }),
                                      ),
                                      /////////////////////////////////////////
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          hintText: 'تأكيد كلمة السر',
                                          suffixIcon: togglePassword(),
                                          border: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        ),
                                        controller: passwordconfirm,
                                        obscureText: isSecurePassword,
                                        validator: ((value) {
                                          if (value == null || value.isEmpty) {
                                            return 'please re-enter your password';
                                          }

                                          if (!RegExp(r'^[أ-ى]|\w|\s+$')
                                              .hasMatch(value)) {
                                            return "Please enter a valid  password";
                                          }
                                          if (password.text !=
                                              passwordconfirm.text) {
                                            return "password not match";
                                          }

                                          return null;
                                        }),
                                      ),
                                      /////////////////////////////////////////

                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                  //sign in button
                                  BlocProvider(
                                    create: (context) => RegisterCubit(),
                                    child: BlocConsumer<RegisterCubit,
                                        RegisterStates>(
                                      listener: (context, state) {
                                        if (state is SuccessesCreateUserState) {
                                          profileCubit = ProfileCubit();
                                          homePatientCubit = HomeCubit();
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) {
                                                return const SuccessMessagePage();
                                              },
                                            ),
                                          );
                                        }
                                      },
                                      builder: (context, state) {
                                        return SizedBox(
                                          height: 100,
                                          child: condition(
                                            condition: state is!LoadingRegisterState,
                                            child: BigButton(
                                              color: Colors.blue.shade900,
                                              onTap: () {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  _signUp();
                                                  RegisterCubit.get(context)
                                                      .registerNewAccount(
                                                          email: email.text,
                                                          password:
                                                              password.text,isOwner: false);
                                                }
                                              },
                                              text: const Text(
                                                'اشتراك',
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Archivo',
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('لديك حساب بالفعل؟'),
                                const SizedBox(
                                  width: 50,
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return const Login();
                                        },
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'سجل دخولك',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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

  void _signUp() {
    patientModel = UserModel(
      name: userName.text,
      email: email.text,
      uId: "uId",
      deviceToken: deviceToken,
      phone: phone.text,
      male: true,
      age: age.text,
      image: "",
      address: address.text,
      ssn: ssn.text,
      role: "patient",
    );
  }
}
