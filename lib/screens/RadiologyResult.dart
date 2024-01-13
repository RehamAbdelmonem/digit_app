import 'package:flutter/material.dart';
import 'package:graduation_project/models/radiologyResult.dart';
import 'package:graduation_project/models/report_model.dart';
import 'package:graduation_project/widgets/RadiologyResultBody/radiology_result_body.dart';

class RadiologyResult extends StatelessWidget {
  final ReportModel model;
  const RadiologyResult({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' نتيجة الأشعة'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: RadiologyResultBody(
        model: model,
      ),
    );
  }
}









//Rehaaaaaaaaaam

//RadiologyResult 
//appbar( نتيجة الأشعة) => دي شاشة تفاصيل كل نتيجة اشعة

// (///////  Backend needed for this screen  ////////)
//1) المفروض تبقا البيانات اللي ظاهرة في كل نتيجة أشعة زي نوع تيجي من الداتا
//2) تاني حاجة زر تقرير الأشعة المفروض يفسر الفورم بتاعة الريبورت اللي رضوى عاملاها



//1) widget folder name => RadiologyResultBody (radiology_result_body)
//$) radiology_result_body => is design of screen 
//   AND is class for (البيانات زي اسم المعمل) of center


//2) model name => radiologyResult => ( دا اللي فيه كل بيانات نتيجة الأشعة  )


