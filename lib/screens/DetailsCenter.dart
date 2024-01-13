import 'package:flutter/material.dart';
import 'package:graduation_project/models/owner_model.dart';
import 'package:graduation_project/models/scan.dart';
import 'package:graduation_project/models/scanOFlab.dart';
import 'package:graduation_project/screens/ScanOfLabScreen.dart';
import 'package:graduation_project/screens/useroffers.dart';
import 'package:graduation_project/widgets/detailsRadiology/details_bodyCenter.dart';

class DetailsLab extends StatelessWidget {
  final LabModel lab;

  const DetailsLab({super.key, required this.lab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: detailsAppbar(context),
      body: SingleChildScrollView(
        child: DetailsBody(
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
        padding: EdgeInsets.only(right: 20),
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
                  builder: (context) => ScanOfLabScreen(
                        typeOfRadiology: lab.radiology??[],
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

//DetailsCenter 
//appbar( رجوع) => (دي شاشة تفاصيل كل مركز)

// (///////  Backend needed for this screen  ////////)
//1) المفروض تبقا البيانات اللي ظاهرة في كل مركز زي الاسم تيجي من الداتا
//2) تاني حاجة التقييم يتخزن في الداتا علشان قيمته تتغير بعد كل ريت اي يوزر هيعمله


//1) widget folder name => detailsRadiology (center_image,details_bodyCenter,RateCenter)
//$) center_image => is design of image 
//$$) details_bodyCenter => is class for (البيانات زي اسم المركز) of center
//$$$) RateCenter => is class for rate of center


//2) model name => scan => ( دا اللي فيه كل بيانات المركز  )