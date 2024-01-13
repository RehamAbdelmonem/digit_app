import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_project/models/testsTypes.dart';
import 'package:graduation_project/shared/network/local/cache_helper.dart';

import '../auth/signup/labowner.dart';

class SelectTypeOfLAbs extends StatefulWidget {
  final List<String> types;

  const SelectTypeOfLAbs({
    Key? key,
    required this.types,
  }) : super(key: key);

  @override
  State<SelectTypeOfLAbs> createState() => _SelectTypeOfLAbsState();
}

class _SelectTypeOfLAbsState extends State<SelectTypeOfLAbs> {
  List<bool> isCheckedList = [];


  _fromCached(){
    List<String> list = CacheHelper.getData(key: "isCheckedListLab")
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
      isCheckedList = List<bool>.filled(widget.types.length, false);
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
        itemCount: widget.types.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              widget.types[index],
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
                  widget.types[i]);
              print(selected);
            }
          }
            _success(context, selected, isCheckedList);
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
                    CacheHelper.saveData(key: "typeOfLabs", value: selected);
                    CacheHelper.saveData(
                        key: "isCheckedListLab",
                        value: isCheckedList.toString());
                    Navigator.pop(context);
                    Navigator.pop(context);

                  },
                ),
              ],
            ));
  }

}


