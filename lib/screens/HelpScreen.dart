import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المساعدة'),
        centerTitle: false,
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'كيف يمكنني حجز موعد في معمل ؟',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'يمكنك حجز موعد في معمل  عن طريق الاتصال بنا أو عن طريق التطبيق.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 32),
            Text(
              'هل يمكنني استرجاع جميع الفحوصات القديمة؟',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'نعم، يمكنك استرجاعها من السجل الطبي لك في التطبيق.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 32),
            Text(
              'كيف يمكنني استلام نتائج الفحوصات',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'سيتم إخطاركم عند جاهزية نتائج الفحص عن طريق التطبيق أو الاتصال بالمعمل. يمكنكم استلام النتائج في المعمل أو استلامها من خلال التطبيق.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 32),
            Text(
              'هل يمكنني إلغاء موعد سابق؟',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'نعم، يمكنك إلغاء موعد سابق عن طريق الاتصال بنا .',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}







//Rehaaaaaaaaaam

//HelpScreen
// appbar(المساعدة ) => (دي شاشة اللي فيها اسئلة تساعد المستخدم)

// (///////  No backend required for this screen  ////////)
