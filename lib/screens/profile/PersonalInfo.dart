import 'package:flutter/material.dart';
import 'package:graduation_project/models/user.dart';
import 'package:graduation_project/widgets/personalInfo/details_body_personal.dart';

class PersonalInfo extends StatelessWidget {
  final User user;

  const PersonalInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: const DetailsInfo(),
    );
  }
}








//Rehaaaaaaaaaam

//PersonalInfo 
//appbar(المعلومات الشخصية ) => الشاشة دي هتعرض بيانات اليوزر


// (///////  Backend needed for this screen  ////////)
//1) المفروض تبقا البيانات اللي ظاهرة  زي الاسم تيجي من الداتا
// بمعنى ان بعد ما اليوزر عمل ريجستر بياناته هتحفظ في الداتا و هتظهر هنا


//1) widget folder name => PersonalInfo (details_body_personal)
//$) details_body_personal => is Ui of Screen
//AND it is class for (البيانات زي اسم اليوزر) 


//2) model name => user => ( دا اللي فيه كل بيانات اليوزر  )
