import 'dart:core';

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:graduation_project/components/componants.dart';
import 'package:graduation_project/models/person.dart';
import 'package:graduation_project/models/report_model.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:image_picker/image_picker.dart';

class Report extends StatefulWidget {
  late String patientId;
  late Person person;
  late bool isEdit;
  String? reportId;
  ReportModel? reportModel;
  Report(
      {required this.patientId,
      required this.person,
      required this.isEdit,
      this.reportId,
        this.reportModel,
      Key? key})
      : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  var formKey = GlobalKey<FormState>();
  var secformKey = GlobalKey<FormState>();
  String name = "";
  File? _image;
  bool _isValid = false;
  bool _loading = false;

  void _saveForm() {
    setState(() {
      _isValid = formKey.currentState!.validate();
    });
  }

  final imagePicker = ImagePicker();

  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

  Future<String> uploadImage() async {
    if (_image != null) {
      return firebase_storage.FirebaseStorage.instance
          .ref()
          .child(
              'data/${widget.patientId}/${Uri.file(_image!.path).pathSegments.last}')
          .putFile(_image!)
          .then((value) async {
        return value.ref.getDownloadURL().then((value) async {
          return value;
        }).catchError((error) {});
      }).catchError((error) {
        print(error.toString());
      });
    } else {
      return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVB5Iyrr550Sex6nDM6E_qzb6sUYXXk26ezcy2QBXJXI3msfUAU8kpBG0YOJtRmk8x3Ik&usqp=CAU";
    }
  }

  final TextEditingController _patientName = TextEditingController();
  final TextEditingController _doctorName = TextEditingController();
  final TextEditingController _labName = TextEditingController();
  final TextEditingController _analysisName = TextEditingController();
  final TextEditingController _analysisPercent = TextEditingController();
  final TextEditingController _analysisReport = TextEditingController();
  final TextEditingController _date = TextEditingController();

  List<bool> _selected = [true, false];
  String typeOfLab = "laboratory";

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    _labName.text = labModel!.labName;
    _patientName.text = widget.person.name;
    if(widget.reportModel!=null) {
      _analysisName.text = widget.reportModel!.analysisName;
      _analysisPercent.text = widget.reportModel!.analysisPercent;
      _analysisReport.text = widget.reportModel!.analysisReport;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue.shade900,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child:  Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            Center(
                              child: Text(
                                'تقرير طبيب المعمل ',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Archivo',
                                  color:
                                  Color.fromARGB(248, 61, 116, 233),
                                ),
                              ),
                            ),
                            // Image(
                            //   image: AssetImage(
                            //       'assets/images/icons8-like-100.png'),
                            //   fit: BoxFit.cover,
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ToggleButtons(
                          isSelected: _selected,
                          color: Colors.grey,
                          fillColor: Colors.green,
                          splashColor: Colors.green,
                          selectedColor: Colors.white,
                          disabledBorderColor: Colors.grey,
                          selectedBorderColor: Colors.green,
                          highlightColor: Colors.grey,
                          borderRadius: BorderRadius.circular(25),
                          borderColor: Colors.grey,
                          disabledColor: Colors.grey,
                          onPressed: (v) {
                            _selected.fillRange(0, 2, false);
                            _selected[v] = true;
                            if (v == 0) {
                              typeOfLab = "laboratory";
                            } else {
                              typeOfLab = "radiology";
                            }
                            setState(() {});
                          },
                          borderWidth: 2,
                          textStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 120,
                            minHeight: 40,
                          ),
                          tapTargetSize: MaterialTapTargetSize.padded,
                          children: const [
                            Text("laboratory"),
                            Text("radiology"),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _patientName,
                          decoration: const InputDecoration(
                            labelText: "اسم المريض",
                            hintText: "الاسم",
                            labelStyle: TextStyle(
                                fontSize: 24, color: Colors.black),
                          ),
                          keyboardType: TextInputType.name,
                          validator: ((value) {
                            // Check if this field is empty
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }

                            // using regular expression
                            if (!RegExp(r'^[أ-ى]|\w|\s+$')
                                .hasMatch(value)) {
                              return "Please enter a valid email address";
                            }

                            // the email is valid
                            return null;
                          }),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _doctorName,
                          decoration: const InputDecoration(
                            labelText: " اسم الطبيب",
                            hintText: "اسم",
                            labelStyle: TextStyle(
                                fontSize: 24, color: Colors.black),
                          ),
                          keyboardType: TextInputType.name,
                          validator: ((value) {
                            // Check if this field is empty
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }

                            return null;
                          }),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _labName,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: "اسم المعمل ",
                            hintText: "اسم",
                            labelStyle: TextStyle(
                                fontSize: 24, color: Colors.black),
                          ),
                          keyboardType: TextInputType.name,
                          validator: ((value) {
                            // Check if this field is empty
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }

                            // the email is valid
                            return null;
                          }),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        if (_selected[0])
                          TextFormField(
                            controller: _analysisName,
                            decoration: const InputDecoration(
                              labelText: "اسم التحليل",
                              hintText: "تحليل",
                              labelStyle: TextStyle(
                                  fontSize: 24, color: Colors.black),
                            ),
                            keyboardType: TextInputType.text,
                            validator: ((value) {
                              // Check if this field is empty
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }

                              // the email is valid
                              return null;
                            }),
                          ),
                        if (_selected[1])
                          TextFormField(
                            controller: _analysisName,
                            decoration: const InputDecoration(
                              labelText: "اسم الاشعة",
                              hintText: "الاشعة",
                              labelStyle: TextStyle(
                                  fontSize: 24, color: Colors.black),
                            ),
                            keyboardType: TextInputType.text,
                            validator: ((value) {
                              // Check if this field is empty
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }

                              // the email is valid
                              return null;
                            }),
                          ),
                        const SizedBox(
                          height: 8,
                        ),
                        if (_selected[0])
                          TextFormField(
                            controller: _analysisPercent,
                            decoration: const InputDecoration(
                              labelText: "نسبة التحليل",
                              hintText: "نسبة",
                              labelStyle: TextStyle(
                                  fontSize: 24, color: Colors.black),
                            ),
                            keyboardType: TextInputType.text,
                            validator: ((value) {
                              // Check if this field is empty
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }

                              /* // using regular expression
                              if (!RegExp(r'^[\d][.][\d]+$').hasMatch(value)) {
                                return "Please enter a valid ratio";
                              }
*/
                              // the email is valid
                              return null;
                            }),
                          ),
                        if (_selected[1])
                          TextFormField(
                            controller: _analysisPercent,
                            decoration: const InputDecoration(
                              labelText: "نسبة الاشعة",
                              hintText: "نسبة",
                              labelStyle: TextStyle(
                                  fontSize: 24, color: Colors.black),
                            ),
                            keyboardType: TextInputType.text,
                            validator: ((value) {
                              // Check if this field is empty
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }

                              /* // using regular expression
                              if (!RegExp(r'^[\d][.][\d]+$').hasMatch(value)) {
                                return "Please enter a valid ratio";
                              }
*/
                              // the email is valid
                              return null;
                            }),
                          ),
                        const SizedBox(
                          height: 8,
                        ),
                        if (_selected[0])
                          TextFormField(
                            controller: _analysisReport,
                            decoration: const InputDecoration(
                              labelText: "تقرير التحليل",
                              hintText: "تقرير",
                              labelStyle: TextStyle(
                                  fontSize: 24, color: Colors.black),
                            ),
                            keyboardType: TextInputType.text,
                            validator: ((value) {
                              // Check if this field is empty
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }

                              // using regular expression
                              if (!RegExp(r'^[أ-ى]|\w|\s+$')
                                  .hasMatch(value)) {
                                return "Please enter a valid email address";
                              }

                              // the email is valid
                              return null;
                            }),
                          ),
                        if (_selected[1])
                          TextFormField(
                            controller: _analysisReport,
                            decoration: const InputDecoration(
                              labelText: "تقرير الاشعة",
                              hintText: "تقرير",
                              labelStyle: TextStyle(
                                  fontSize: 24, color: Colors.black),
                            ),
                            keyboardType: TextInputType.text,
                            validator: ((value) {
                              // Check if this field is empty
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }

                              // using regular expression
                              if (!RegExp(r'^[أ-ى]|\w|\s+$')
                                  .hasMatch(value)) {
                                return "Please enter a valid email address";
                              }

                              // the email is valid
                              return null;
                            }),
                          ),
                        const SizedBox(
                          height: 25,
                        ),
                        if(widget.reportModel!=null)
                        Image.network(widget.reportModel!.image),
                        const Text(
                          ' ارفق صورة التقرير',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    height: 359,
                                    width: 268,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius:
                                        BorderRadius.circular(30)),
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(30),
                                      child: _image == null
                                          ? IconButton(
                                        onPressed: () {
                                          getImage();
                                        },
                                        icon: const Icon(
                                            Icons.camera_enhance),
                                        color:
                                        Colors.red.shade600,
                                      )
                                          : Image.file(_image!),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        getImage();
                                      },
                                      child: const Text(
                                        'تغيير',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.red),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 60),

                        TextFormField(
                          controller: _date,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickkeddate =
                            await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2023),
                                lastDate: DateTime(2053))
                                .then((value) {
                              setState(() {
                                _date.text = value!.year.toString() +
                                    "/" +
                                    value.month.toString() +
                                    "/" +
                                    value.day.toString();
                              });
                            }).onError((error, stackTrace) => null);
                          },
                          decoration: const InputDecoration(
                            labelText: "تاريخ التحليل",
                            prefixIcon: Icon(
                              Icons.date_range_outlined,
                              color: Colors.blue,
                            ),
                            hintText: "تاريخ",
                            labelStyle: TextStyle(
                                fontSize: 24, color: Colors.black),
                          ),
                          keyboardType: TextInputType.datetime,
                          validator: ((value) {
                            // Check if this field is empty
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }

                            // using regular expression

                            // the email is valid
                            return null;
                          }),
                        ),
                        const SizedBox(height: 25),
                        condition(
                          condition: !_loading,
                          child: TextButton(
                            onPressed: () {
                              _saveForm();
                              if (_isValid) {
                                _loading = true;
                                setState(() {});
                              }
                              if (widget.isEdit) {
                                _updateReport();
                              } else {
                                _sendReport();
                              }
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                    248, 61, 116, 233),
                                foregroundColor: Colors.white),
                            child: const Text(
                              'تاكيد بيانات المريض',
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        _isValid
                            ? const Image(
                          image: AssetImage(
                              'assets/gifs/icons8-verified-account.gif'),
                          fit: BoxFit.cover,
                        )
                            : Container(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _sendReport() async {
    if (_isValid) {
      ReportModel report = ReportModel(
        id: "id",
        patientName: _patientName.text,
        doctorName: _doctorName.text,
        labName: _labName.text,
        analysisName: _analysisName.text,
        analysisPercent: _analysisPercent.text,
        date: _date.text,
        analysisReport: _analysisReport.text,
        image: await uploadImage(),
        typeOfLab: typeOfLab,
        labId: labModel!.labId,
      );
      FirebaseFirestore.instance
          .collection("patient")
          .doc(widget.patientId)
          .collection("reports")
          .add(report.toMaP())
          .then((value) {
        FirebaseFirestore.instance
            .collection("patient")
            .doc(widget.patientId)
            .collection("reports")
            .doc(value.id)
            .update({"id": value.id}).then((value) {
          Navigator.pop(context, {widget.patientId, true});
        }).catchError((error) {
          _loading = false;
          setState(() {});
        });
      }).catchError((error) {
        _loading = false;
        setState(() {});
      });
    }
  }

  Future<void> _updateReport() async {
    if (_isValid) {
      ReportModel report = ReportModel(
        id: widget.reportId!,
        patientName: _patientName.text,
        doctorName: _doctorName.text,
        labName: _labName.text,
        analysisName: _analysisName.text,
        analysisPercent: _analysisPercent.text,
        date: _date.text,
        analysisReport: _analysisReport.text,
        image: await uploadImage(),
        typeOfLab: typeOfLab,
        labId: labModel!.labId,
      );
      FirebaseFirestore.instance
          .collection("patient")
          .doc(widget.patientId)
          .collection("reports")
          .doc(widget.reportId)
          .update(report.toMaP())
          .then((value) {
        Navigator.pop(context, {widget.patientId, true});
      }).catchError((error) {
        _loading = false;
        setState(() {});
      });
    }
  }
}
