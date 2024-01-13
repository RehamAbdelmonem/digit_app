import 'package:flutter/material.dart';
import 'package:graduation_project/models/owner_model.dart';
import 'package:graduation_project/models/test.dart';
import 'package:graduation_project/screens/AppointmentTest.dart';
import 'package:graduation_project/screens/auth/login/login.dart';
import 'package:graduation_project/screens/lab/Laboratories.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/widgets/detailsLaboratories/RateLaboratories.dart';
import 'package:graduation_project/widgets/detailsLaboratories/lab_image.dart';

import '../../screens/auth/signup/mymainPage.dart';

class DetailsBodyLab extends StatelessWidget {
  final LabModel lab;

  const DetailsBodyLab({super.key, required this.lab});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20 * 1.5),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TestImage(
                  size: size,
                  image: lab.labImage,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  lab.labName,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue.shade900,
                  ),
                ),
              ),
              Container(
                //alignment: Alignment.bottomCenter,
                child: RateLaboratories(lab.labId),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.description,
                color: Colors.white,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(
                //     horizontal: 20 * 1.5,
                vertical: 10,
              ),
              child: const Text(
                "معمل تحاليل",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                ),
              ),
            ),
          ],
        ),
        Container(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(
                    // horizontal: 20 * 1.5,
                    //  vertical: 10,
                    ),
                child: Text(
                  lab.labPhone,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          // margin: EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          height: 80,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.location_on_rounded,
                  color: Colors.white,
                ),
              ),
              Text(
                lab.labAddress,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 40.0,
            width: 160.0,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Center(
              child: InkWell(
                onTap: () {
                  if(myId!=null) {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  AppointmentTest(lab),
                    ),
                  );
                  }else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const Login(),
                      ),
                    );

                  }
                },
                child: Text(
                  ' حدد موعد',
                  style: TextStyle(
                      color: Colors.blue.shade900,
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}





//Rehaaaaaaaaaam