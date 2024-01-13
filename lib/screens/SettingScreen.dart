import 'package:flutter/material.dart';
import 'package:graduation_project/models/user.dart';
import 'package:graduation_project/screens/ChangePassword.dart';
import 'package:graduation_project/screens/profile/UpdateProfileScreen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الإعدادات'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'إعدادات الحساب',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text('تعديل الملف الشخصي'),
            leading: Icon(Icons.person),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateProfileScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('تغيير كلمة المرور'),
            leading: Icon(Icons.lock),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangePasswordScreen(),
                ),
              );
            },
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'الإشعارات',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text('تفعيل / إيقاف الإشعارات'),
            trailing: Switch(
              value: true,
              onChanged: (bool value) {},
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'اللغة',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text('تغيير اللغة'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(),
        ],
      ),
    );
  }
}







//Rehaaaaaaaaaam

//SettingsScreen 
//appbar( الإعدادات) => دي شاشة تفاصيل كل معمل

// (///////  No Backend needed for this screen  ////////)
