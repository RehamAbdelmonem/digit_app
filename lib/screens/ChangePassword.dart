import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/components/constants.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  List<bool> isSecurePassword=List.filled(3, false);
  TextEditingController currentPassword=TextEditingController();
  TextEditingController newPassword=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('تغيير كلمة المرور'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور الحالية',
                  suffixIcon: togglePassword(0),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 1),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10))),
                ),
                controller: currentPassword,
                obscureText: isSecurePassword[0],
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
              const SizedBox(height: 20),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور الجديدة',
                  suffixIcon: togglePassword(1),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 1),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10))),
                ),
                controller: newPassword,
                obscureText: isSecurePassword[1],
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter your password';
                  }

                  if (!RegExp(r'^[أ-ى]|\w|\s+$')
                      .hasMatch(value)) {
                    return "Please enter a valid  password";
                  }
                  if(value.length<6){
                    return 'password must be more than or equal 6 chars';
                  }

                  return null;
                }),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'تأكيد كلمة المرور الجديدة',
                  suffixIcon: togglePassword(2),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 1),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10))),
                ),
                controller: confirmPassword,
                obscureText: isSecurePassword[2],
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'please re-enter your password';
                  }

                  if (!RegExp(r'^[أ-ى]|\w|\s+$')
                      .hasMatch(value)) {
                    return "Please enter a valid  password";
                  }
                  if (newPassword.text !=
                      confirmPassword.text) {
                    return "password not match";
                  }

                  return null;
                }),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade900,
                ),
                onPressed: () {
                  _changePassword(
                    currentPassword: currentPassword.text,
                    newPassword: newPassword.text,
                  );
                },
                child: const Text(
                  'تغيير كلمة المرور',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changePassword({
  required String currentPassword,
  required String newPassword,
}){

      AuthCredential credential = EmailAuthProvider.credential(
          email: patientModel!.email, password: currentPassword);
      FirebaseAuth.instance.currentUser?.reauthenticateWithCredential(
          credential).then((value){
            FirebaseAuth.instance.currentUser?.updatePassword(newPassword).then((value){
        _showDone("done");
      });
      }).catchError((error){
        _showDone(error.message);

      });

  }

  Widget togglePassword(int index) {
    return IconButton(
      onPressed: () {
        setState(() {
          isSecurePassword[index] = !isSecurePassword[index];
        });
      },
      icon: isSecurePassword[index]
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
  void _showDone(String message){
    showDialog(context: context, builder: (context) => CupertinoAlertDialog(
      content: Text(message),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: const Text("OK")),
      ],
    ),);
  }
}




//Rehaaaaaaaaaam

//ChangePasswordScreen 
//appbar(تغيير كلمة المرور ) => (الشاشة دي هتعدل الباسورد)

// (///////  Backend needed for this screen  ////////)
//1) المفروض بقا الباسورد اللي هيتعدل  يتحفظ في الداتا
// و بالتالي التعديلات دي هتسمع في لما يجي يعمل لوجين


//2) model name => user => ( دا اللي فيه الباسورد  )

