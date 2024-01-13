import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:graduation_project/models/radiologyResult.dart';
import 'package:graduation_project/models/testResult.dart';
import 'package:graduation_project/models/user.dart';
import 'package:graduation_project/screens/home/HomePage.dart';
import 'package:graduation_project/screens/ListOfScans.dart';
import 'package:graduation_project/screens/ListOfTests.dart';
import 'package:graduation_project/screens/profile/ProfileScreen.dart';
import 'package:graduation_project/screens/lab/Radiology.dart';
import 'package:graduation_project/screens/RadiologyResult.dart';
import 'package:graduation_project/screens/TestResult.dart';

class MedicalRecord extends StatelessWidget {
  const MedicalRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'السجل الطبي',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              width: 400,
              height: 190,
              margin: EdgeInsets.all(20),

              // padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListOfTests()),
                  );
                },
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/Anim2.jpg",
                        height: 250,
                        width: 400,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text(
                        "نتائج  التحاليل ",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15)),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 400,
              height: 190,
              margin: EdgeInsets.all(20),
              // padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListOfScans()),
                  );
                },
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/radiology.jpg",
                        height: 250,
                        width: 400,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text(
                        "نتائج الأشعة",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.blue.shade900),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: GNav(
            color: Colors.white,
            activeColor: Colors.grey.shade50,
            hoverColor: Colors.grey.shade50,
            gap: 8,
            padding: const EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.home,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              // GButton(
              //   icon: Icons.search,
              // ),
              GButton(
                icon: Icons.person,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(user: Users[0])),
                  );
                },
              ),
              GButton(
                icon: Icons.message,
                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => HomePage()),
                //   );
                // },
              ),
            ],
          ),
        ),
      ),
    );
  }
}







//Rehaaaaaaaaaam

// MedicalRecord
// appbar(السجل الطبي ) => (دي شاشة اللي فيها بيختار المستخم نتائج اشعة ولا تحاليل)

//MedicalRecord (///////  No backend required for this screen  ////////)

//اللي ناقص رضوى تحط الروت بتاع ايقون المسدج

