import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/lab/Laboratories.dart';
import 'package:graduation_project/screens/lab/Radiology.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import '../components/componants.dart';
import '../models/appointment_model.dart';
import '../models/message_model.dart';
import '../models/owner_model.dart';
import '../shared/components/constants.dart';
import '../shared/network/local/cache_helper.dart';
import 'chats/chats_screen.dart';
import 'select_type_labs/select_typeOf_labs.dart';

class AppointmentCenter extends StatefulWidget {
  late LabModel lab;

  AppointmentCenter(this.lab, {super.key});

  @override
  State<AppointmentCenter> createState() => _AppointmentState();
}

class _AppointmentState extends State<AppointmentCenter> {
  String gender = "ذكر";
  bool isChecked = false;
  bool _valid = false;
  bool _lading = false;
  bool showAddressInput = false;
  String selectedDate = '';
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _typeOfLab = TextEditingController();
  final TextEditingController _dateOfAppointment = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isTypesEmpty() {
    List<String> typeOfLabs = CacheHelper.getData(key: "typeOfLabs") != null
        ? List.from(
            CacheHelper.getData(key: "typeOfLabs").map((e) => e.toString()))
        : [];
    if (typeOfLabs.isEmpty) {
      return true;
    } else {
      _typeOfLab.text = "تم تحديد ${typeOfLabs.length}";
      setState(() {});
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _valid = _formKey.currentState!.validate();
      setState(() {});
    });
    return Scaffold(
      appBar: detailsAppbar(context),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.blue.shade900,
                    size: 140,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    "حجز موعد",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xffE1F5FE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _username,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "اسم المستخدم",
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff5D666A),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xffE1F5FE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "البريد الإلكتروني",
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff5D666A),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xffE1F5FE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _phone,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "الهاتف",
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff5D666A),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffE1F5FE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Radio(
                          value: "ذكر",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                            });
                          },
                        ),
                        const Text(
                          "ذكر",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff5D666A),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Radio(
                          value: "أنثى",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                            });
                          },
                        ),
                        const Text(
                          "أنثى",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff5D666A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xffE1F5FE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _typeOfLab,
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "نوع الاشعة",
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff5D666A),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectTypeOfLAbs(
                                    types: widget.lab.radiology!,
                                  )),
                        );
                      },
                      validator: (value) {
                        if (_isTypesEmpty()) {
                          return "Select minimum on Type";
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffE1F5FE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value ?? false;
                                  showAddressInput = isChecked;
                                });
                              },
                            ),
                            const Text(
                              'خدمة منزلية ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff5D666A),
                              ),
                            ),
                          ],
                        ),
                        if (showAddressInput)
                          TextFormField(
                            controller: _address,
                            decoration: const InputDecoration(
                              hintText: 'أدخل العنوان هنا',
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff5D666A),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xffE1F5FE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _dateOfAppointment,
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'تاريخ الموعد',
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff5D666A),
                      ),
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _dateOfAppointment.text =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  condition(
                    condition: !_lading,
                    child: SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: Material(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue.shade900,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text('رسالة تأكيد'),
                                      content: _valid
                                          ? const Text("تم تأكيد حجز الموعد ")
                                          : const Text(" خطئ في بيانات الموعد "),
                                      actions: [
                                        TextButton(
                                          child: const Text('موافق'),
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              Navigator.pop(context);
                                              setState(() {
                                                _lading = true;
                                                _valid = true;
                                              });
                                              sendAppointment();
                                            } else {
                                              Navigator.pop(context);
                                            }
                                          },
                                        ),
                                      ],
                                    ));
                          },
                          child: const Center(
                            child: Text(
                              "إرسال",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar detailsAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.shade900,
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.only(right: 20),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: const Text(
        'رجوع',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Future<void> sendAppointment() async {
    List<String> typeOfLabs = await CacheHelper.getData(key: "typeOfLabs");
    AppointmentModel appointment = AppointmentModel(
      username: _username.text,
      email: _email.text,
      uId: myId!,
      phone: _phone.text,
      address: _address.text,
      type: "Radiology",
      dateOfAppointment: _dateOfAppointment.text,
      age: 0,
      deviceToken: patientModel!.deviceToken,
      image: patientModel!.image,
      homeService: isChecked,
      typeOfLab: typeOfLabs,
      gender: gender,
      timeStamp: (DateTime.now().millisecondsSinceEpoch).toString(),
    );
    await FirebaseFirestore.instance
        .collection("labs")
        .doc(widget.lab.labId)
        .collection("appointments")
        .add(appointment.toMaP())
        .then((value) async {
      await sendMessage(typeOfLabs);
    });
  }

  Future<void> sendMessage(List<String> typeOfLabs) async {
    int index = await getIndex();
    MessageModel message = MessageModel(
      senderId: widget.lab.labId,
      receiverId: myId!,
      text: "تم حجز معاد بتاريخ ${_dateOfAppointment.text}\n"
          "\n باسم ${_username.text}"
          "\n هاتف :${_phone.text}"
          "\nلعمل ${typeOfLabs.join("\n")}\n"
          "${isChecked ? "\n${_address.text}" : ""}",
      dateTime: Jiffy().yMMMMEEEEdjm,
      indexMessage: index,
    );
    await FirebaseFirestore.instance
        .collection("labs")
        .doc(widget.lab.labId)
        .collection("chats")
        .doc(myId)
    .set({"id":myId});
    await FirebaseFirestore.instance
        .collection("labs")
        .doc(widget.lab.labId)
        .collection("chats")
        .doc(myId)
        .collection("messages")
        .add(message.toMap());
    await FirebaseFirestore.instance
        .collection("patient")
        .doc(myId)
        .collection("chats")
        .doc(widget.lab.labId)
    .set({"labId":widget.lab.labId});
    await FirebaseFirestore.instance
        .collection("patient")
        .doc(myId)
        .collection("chats")
        .doc(widget.lab.labId)
        .collection("messages")
        .add(message.toMap());
    CacheHelper.removeData(
        key: "isCheckedList");
    CacheHelper.removeData(
        key: "typeOfLabs").then((value){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChatsScreen(),),
      );
    });


  }

  Future<int> getIndex() async {
    return FirebaseFirestore.instance
        .collection("patient")
        .doc(myId)
        .collection("chats")
        .doc(widget.lab.labId)
        .collection("messages")
        .get()
        .then((value) {
      return value.size;
    }).catchError((error) {
      return 0;
    });
  }
}

//Rehaaaaaaaaaam

//AppointmentCenter
//appbar( رجوع) => (دي شاشة حجز ميعاد بس لمركز أشعة)

// (///////  Backend needed for this screen  ////////)
//1) المفروض تبقا البيانات اللي هيدخلها في الفورم تتحفظ في الداتا
//2)  و كمان الداتا ترجع لصفحة الادمن اللي فيها المواعيد المحجوزة

// """ ملحوظة شاشة الادمن اللي بيستقبل فيها المواعيد المحجوزة رضوى اللي عملاها"""
