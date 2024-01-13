import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/ListOfTests/ListOfTestsBody.dart';

class ListOfTests extends StatelessWidget {
  const ListOfTests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: laboratoryAppBar(context),
      body: ListOfTestsBody(),
    );
  }

  AppBar laboratoryAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text("نتائج التحاليل "),
      centerTitle: false,
      backgroundColor: Colors.blue.shade900,
    );
  }
}






//Rehaaaaaaaaaam

//ListOfTests 
//appbar(نتائج التحاليل  ) => (قايمة نتائج التحاليل)


// (///////  Backend needed for this screen  ////////)
//1) المفروض تبقا البيانات اللي ظاهرة قصاد كل نتيجة اشعة زي الاسم تيجي من الداتا


//1) widget folder name => ListOfTests (ListOfTestsBody,ListOfTestsData)
//$) ListOfTestsBody => is Ui of List of Tests
//$$) ListOfTestsData => is class for (البيانات زي اسم المعمل) 


//2) model name => testResult => ( دا اللي فيه كل بيانات نتيجة التحليل  )