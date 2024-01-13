import 'package:flutter/material.dart';
import 'package:graduation_project/models/user.dart';
import 'package:graduation_project/widgets/UpdateProfile/update_profile_body.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatelessWidget {

  const UpdateProfileScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: const Text(
            'تعديل الصفحة الشخصية',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body:  UpdateProfilebody());
  }
}







//Rehaaaaaaaaaam


//UpdateProfileScreen 
//appbar(تعديل الصفحة الشخصية ) => الشاشة دي هتعدل بيانات اليوزر


// (///////  Backend needed for this screen  ////////)
//1) المفروض تبقا البيانات اللي هتتعدل  زي الاسم تتحفظ في الداتا
// و بالتالي التعديلات دي هتسمع في شاشة المعلومات الشخصية


//1) widget folder name => UpdateProfile (update_profile_body)
//$) update_profile_body => is Ui of Screen
//AND it is class for (البيانات اللي ممكن تتعدل زي اسم اليوزر) 



//2) model name => user => ( دا اللي فيه كل بيانات اليوزر  )