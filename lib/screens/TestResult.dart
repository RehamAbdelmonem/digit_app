import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/testResult/test_result_body.dart';

import '../models/report_model.dart';

class TestResult extends StatelessWidget {
   late  String patientId;
     String? reportId;
     ReportModel? reportModel;
   TestResult({
     required this.patientId,
      this.reportId,
      this.reportModel,
     super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(' نتيجة التحليل'),
          backgroundColor: Colors.blue.shade900,
        ),
        body: TestResultBody(
          patientId: patientId,
          reportId: reportId,
          reportModel: reportModel,
        ));
  }
}








//Rehaaaaaaaaaam


//TestResult 
//appbar( نتيجة التحليل) => دي شاشة تفاصيل كل نتيجة التحليل


// (///////  Backend needed for this screen  ////////)
//1) المفروض تبقا البيانات اللي ظاهرة في كل نتيجة تحليل زي نوع تيجي من الداتا
//2) تاني حاجة زر تقرير التحليل المفروض يفسر الفورم بتاعة الريبورت اللي رضوى عاملاها



//1) widget folder name => testResult (test_result_body)
//$) test_result_body => is design of screen 
//   AND is class for (البيانات زي اسم المعمل) of Lab


//2) model name => testResult => ( دا اللي فيه كل بيانات نتيجة التحليل  )

