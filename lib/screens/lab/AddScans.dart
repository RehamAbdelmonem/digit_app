import 'package:flutter/material.dart';
import 'package:graduation_project/models/scansTypes.dart';
import 'package:graduation_project/shared/network/local/cache_helper.dart';

import '../auth/signup/labowner.dart';


class AddScansScreen extends StatefulWidget {
  final List<ScanType> scanTypes;

  const AddScansScreen({
    Key? key,
    required this.scanTypes,
  }) : super(key: key);

  @override
  State<AddScansScreen> createState() => _AddScansScreenState();
}

class _AddScansScreenState extends State<AddScansScreen> {
  List<bool> isCheckedList = [];

  _fromCached() {
    List<String> list = CacheHelper.getData(key: "isCheckedListScan")
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(" ", "")
        .split(',');
    for (var element in list) {
      if (element == "true") {
        isCheckedList.add(true);
      } else if (element == "false") {
        isCheckedList.add(false);
      } else {
        isCheckedList = [];
      }
    }

    if (isCheckedList.isEmpty) {
      isCheckedList = List<bool>.filled(widget.scanTypes.length, false);
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
        title: Text('إضافة انواع الأشعة '),
        backgroundColor: Colors.blue.shade900,
      ),
      body: ListView.builder(
        itemCount: widget.scanTypes.length,
        itemBuilder: (context, index) {
          final scanType = widget.scanTypes[index];
          return ListTile(
            title: Text(
              scanType.name,
              style: TextStyle(
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
                  "${widget.scanTypes[i].name},${widget.scanTypes[i].code}");
              print(selected);
            }
          }
          if (selected.length >= 20) {
            _success(context, selected, isCheckedList);
          } else {
            _error(context);
          }
          final selectedScanTypes = widget.scanTypes
              .where((type) => isCheckedList[widget.scanTypes.indexOf(type)])
              .toList();
          print(selectedScanTypes);
        },
        child: Icon(Icons.save_rounded, color: Colors.white),
      ),
    );
  }
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
                  CacheHelper.saveData(key: "radiology", value: selected);
                  CacheHelper.saveData(key: "isCheckedListScan", value: isCheckedList.toString());
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

// Route

// Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => AddScansScreen(
//                               scanTypes: ScanTypes,
//                             )),
//                   );

//Rehaaaaaaaaaam

//AddScansScreen
//appbar( إضافة أنواع الأشعة ) => دي شاشة المعمل بيختار الأشعة اللي متاحه عنده

// (///////  Backend needed for this screen  ////////)
//1) المفروض  كل نوع أشعة المعمل هيختاره .. يتخزن في التابل الخاص ب أشعة المعمل

//3) model name => scansTypes => ( دا اللي فيه كل بيانات أنواع الأشعة  )
