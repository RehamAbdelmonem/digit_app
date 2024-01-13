import 'package:flutter/material.dart';
import 'package:graduation_project/screens/auth/signup/signup.dart';

class MytextButton extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return SignUP();
            },
          ),
        );
      },
      child: const Text('التحقق'),
    );
  }
}
