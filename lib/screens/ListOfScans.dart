import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/ListOfScans/ListOfScansBody.dart';
import 'package:graduation_project/widgets/ListOfTests/ListOfTestsBody.dart';

class ListOfScans extends StatelessWidget {
  const ListOfScans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: laboratoryAppBar(context),
      body: ListOfScansBody(),
    );
  }

  AppBar laboratoryAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text("نتائج الأشعة  "),
      centerTitle: false,
      backgroundColor: Colors.blue.shade900,
    );
  }
}








//Rehaaaaaaaaaam

//ListOfScans 
//appbar(نتائج الأشعة  ) => (قايمة نتائج الأشعة)

// (///////  Backend needed for this screen  ////////)
//1) المفروض تبقا البيانات اللي ظاهرة قصاد كل نتيجة تحليل زي الاسم تيجي من الداتا


//1) widget folder name => ListOfScans (ListOfScansBody,ListOfScanData)
//$) ListOfScansBody => is Ui of List of Scans
//$$) ListOfScanData => is class for (البيانات زي اسم المركز) 


//2) model name => radiologyResult => ( دا اللي فيه كل بيانات نتيجة الأشعة  )