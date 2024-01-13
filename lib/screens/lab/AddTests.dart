import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_project/models/testsTypes.dart';
import 'package:graduation_project/shared/network/local/cache_helper.dart';

import '../auth/signup/labowner.dart';

class AddTestsScreen extends StatefulWidget {
  final List<TestType> testTypes;

  const AddTestsScreen({
    Key? key,
    required this.testTypes,
  }) : super(key: key);

  @override
  State<AddTestsScreen> createState() => _AddTestsScreenState();
}

class _AddTestsScreenState extends State<AddTestsScreen> {
  List<bool> isCheckedList = [];


  _fromCached(){
    List<String> list = CacheHelper.getData(key: "isCheckedListTest")
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(" ", "")
        .split(',');
    for (var element in list) {
      if(element=="true") {
        isCheckedList.add(true);
      }else if(element=="false"){
        isCheckedList.add(false);
      }else{
        isCheckedList=[];
      }
    }

    if (isCheckedList.isEmpty) {
      isCheckedList = List<bool>.filled(widget.testTypes.length, false);
    }
  }

  @override
  void initState() {
    super.initState();
    _fromCached();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة انواع التحاليل '),
        backgroundColor: Colors.blue.shade900,
      ),
      body: ListView.builder(
        itemCount: widget.testTypes.length,
        itemBuilder: (context, index) {
          final testType = widget.testTypes[index];
          return ListTile(
            title: Text(
              testType.name,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            trailing: Checkbox(
              value: isCheckedList[index],
              onChanged: (value) {
                setState(() {
                  isCheckedList[index] = value ?? false;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        onPressed: () {
          List<String> selected = [];
          for (int i = 0; i < isCheckedList.length; i++) {
            if (isCheckedList[i]) {
              selected.add(
                  "${widget.testTypes[i].name},${widget.testTypes[i].code}");
              print(selected);
            }
          }
          if (selected.length >= 20) {
            _success(context, selected, isCheckedList);
          } else {
            _error(context);
          }
          final selectedTestTypes = widget.testTypes
              .where((type) => isCheckedList[widget.testTypes.indexOf(type)])
              .toList();
          print(selectedTestTypes);
        },
        child: const Icon(Icons.save_rounded, color: Colors.white),
      ),
    );
  }

  void _success(context, selected, isCheckedList) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'رسالة تأكيد',
                style: TextStyle(color: Colors.blue.shade900, fontSize: 25),
              ),
              content: Text(
                "تم حفظ أنواع الأشعة بنجاح  ",
                style: TextStyle(color: Colors.blue.shade900, fontSize: 20),
              ),
              actions: [
                TextButton(
                  child: Text(
                    'موافق',
                    style: TextStyle(color: Colors.blue.shade900, fontSize: 20),
                  ),
                  onPressed: () {
                    CacheHelper.saveData(key: "laboratory", value: selected);
                    CacheHelper.saveData(
                        key: "isCheckedListTest",
                        value: isCheckedList.toString());
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => OwnerRegister(scroll: true,)));
                  },
                ),
              ],
            ));
  }

  void _error(context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'رسالة خاطئ',
                style: TextStyle(color: Colors.blue.shade900, fontSize: 25),
              ),
              content: Text(
                "هذه العدد غير كافي يجب اختيار 20 عنصر كحد ادني  ",
                style: TextStyle(color: Colors.blue.shade900, fontSize: 20),
              ),
              actions: [
                TextButton(
                  child: Text(
                    'موافق',
                    style: TextStyle(color: Colors.blue.shade900, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                ),
              ],
            ));
  }
}

// Route

// Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => AddTestsScreen(
//                               testTypes: TestTypes,
//                             )),
//                   );

//Rehaaaaaaaaaam

//AddTestsScreen
//appbar( إضافة أنواع التحاليل ) => دي شاشة المعمل بيختار التحاليل اللي متاحه عنده

// (///////  Backend needed for this screen  ////////)
//1) المفروض  كل نوع تحليل المعمل هيختاره .. يتخزن في التابل الخاص بتحاليل المعمل

//3) model name => testsTypes => ( دا اللي فيه كل بيانات أنواع التحاليل  )
