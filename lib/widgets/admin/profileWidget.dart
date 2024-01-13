import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graduation_project/screens/adminUpdateProfile.dart';

class ProfileWidget extends StatefulWidget {
  String name;
  String email;
  String password;
  String location;
  ProfileWidget(
      {super.key,
      required this.name,
      required this.email,
      required this.password,
      required this.location});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
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
                    child: Container(
                  child: Row(children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      ////////////////لو احط ارو بيرجع
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 75.0),
                      child: Text(
                        ' ',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ]),
                )),
              ),
            
          ),
        );
      },
    );
  }
      }
      
  





