import 'package:flutter/material.dart';
import 'package:graduation_project/models/owner_model.dart';
import 'package:graduation_project/screens/TestsOfLabScreen.dart';
import 'package:graduation_project/screens/useroffers.dart';
import 'package:graduation_project/widgets/detailsLaboratories/details_bodyLab.dart';

class DetailsLaboratories extends StatelessWidget {
  final LabModel lab;

  const DetailsLaboratories({super.key, required this.lab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: detailsAppbar(context),
      body: SingleChildScrollView(
        child: DetailsBodyLab(
          lab: lab,
        ),
      ),
    );
  }

  AppBar detailsAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.only(right: 20),
        icon: Icon(
          Icons.arrow_back,
          color: Colors.blue.shade900,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        'رجوع',
        style: TextStyle(fontSize: 20, color: Colors.blue.shade900),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.format_list_bulleted,
            color: Colors.blue.shade900,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TestOfLabScreen(
                        typeOfLabs: lab.laboratory??[],
                      )),
            );
          },
        ),
        IconButton(
          icon: Icon(
            Icons.local_offer,
            color: Colors.blue.shade900,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  Useroffers(lab.labId)),
            );
          },
        ),

      ],
    );
  }
}






//Rehaaaaaaaaaam

//DetailsLaboratories 
//appbar( رجوع) => (دي شاشة تفاصيل كل معمل)

// (///////  Backend needed for this screen  ////////)
//1) المفروض تبقا البيانات اللي ظاهرة في كل معمل زي الاسم تيجي من الداتا
//2) تاني حاجة التقييم يتخزن في الداتا علشان قيمته تتغير بعد كل ريت اي يوزر هيعمله


//1) widget folder name => detailsLaboratories (lab_image,details_bodyLab,RateLaboratories)
//$) lab_image => is design of image 
//$$) details_bodyLab => is class for (البيانات زي اسم المعمل) of Lab
//$$$) RateLaboratories => is class for rate of lab


//2) model name => test => ( دا اللي فيه كل بيانات المعمل  )
