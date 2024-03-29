
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/onboarding/screens/onboarding/screen_two.dart';


import '../../../auth/signup/mymainPage.dart';
import '../../constants/constants.dart';
import 'components/slanding_clipper.dart';

class OnboardingScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //it will helps to return the size of the screen
    Size size = MediaQuery.of(context).size;

    
        return 
        MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) 
        {
          return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: Image(
                    width: size.width,
                    height: size.height * 0.6,
                    fit: BoxFit.contain,
                    image: const AssetImage('assets/images/microscope(1).png'),
                  ),
                ),
                ClipPath(
                  clipper: SlandingClipper(),
                  child: Container(
                    height: size.height * 0.4,
                    color: blue,
                  ),
                )
              ],
            ),
            Positioned(
              
              top: size.height * 0.65,
              child: Container(
                width: size.width,
                
                padding: EdgeInsets.all(appPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'اختر معمل',
                     
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: white,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      'يمكنك الآن انشاء حسابك الخاص \nواختيار معملك بدقة \nفاي مكان داخل بنها.',
                   
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: appPadding / 4),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: white),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: appPadding / 4),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: blue),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: appPadding / 4),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        border: Border.all(color: black, width: 2),
                        shape: BoxShape.circle,
                        color: blue),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: appPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                     
                      onPressed: ()  {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MyMain(),
                          ),
                        );
                      },
                      child: Text(
                        'تخطي',
                        style: TextStyle(
                          color: black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: appPadding,left: appPadding),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => OnboardingScreenTwo(),
                          ),
                        );
                      },
                      backgroundColor: white,
                      child: Icon(
                        Icons.navigate_next_rounded,
                        color: black,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
  )  );
   } );
  }
}
