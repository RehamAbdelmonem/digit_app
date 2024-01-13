import 'package:flutter/material.dart';

import 'auth/signup/mymainPage.dart';


class SuccessMessagePage extends StatelessWidget {
  const SuccessMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return 
     Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child:
             Text('تم انشاء حسابك بنجاح',style: TextStyle(fontSize: 26),),),
             const ClipRRect(child:  Image(image: AssetImage('assets/images/good-pincode-100.png')),
             ),
             MaterialButton(onPressed: (){
               Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            return const MyMain();
                                          },
                                        ),
                 (route) => false,
                                      );
             },
             child: const Text('العودة للصفحة الرئيسية'),),
        ],
      ),


     );
  }
}