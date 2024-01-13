import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/appointment_model.dart';

import 'package:graduation_project/widgets/admin/appoinListWidget.dart';

import 'package:graduation_project/models/admin/appointmentModel.dart';

import '../shared/components/constants.dart';

class AppointPage extends StatefulWidget {
  const AppointPage({Key? key}) : super(key: key);

  // const AppointPage({Key? key}) : super(key: key);

  @override
  State<AppointPage> createState() => _AppointPage();
}

class _AppointPage extends State<AppointPage> {
  List<AppointRequester> requester = [
    AppointRequester(
        name: "رضوي جمال محمد",
        appointmentType: "test",
        imageUrl: "assets/images/image1.png",
        date: "Now"),
    AppointRequester(
        name: "ريهام عبدالمنعم عمري",
        appointmentType: "radiology",
        imageUrl: "assets/images/image1.png",
        date: "Yesterday"),
    AppointRequester(
        name: "سلمي رافت محمد",
        appointmentType: "radiology",
        imageUrl: "assets/images/image1.png",
        date: "31 Mar"),
    AppointRequester(
        name: "ايمان السيد احمد",
        appointmentType: " test-radiology",
        imageUrl: "assets/images/image1.png",
        date: "Now"),
    AppointRequester(
        name: "ايمان احمد حمدي",
        appointmentType: "test",
        imageUrl: "assets/images/image1.png",
        date: "Yesterday"),
    AppointRequester(
        name: "محمد عبدالحليم",
        appointmentType: "test",
        imageUrl: "assets/images/image1.png",
        date: "28 Mar"),
    AppointRequester(
        name: "رحمة جمال",
        appointmentType: "radiology",
        imageUrl: "assets/images/image1.png",
        date: "23 Mar"),
    AppointRequester(
        name: "سهيلة عبدالله",
        appointmentType: "radiology",
        imageUrl: "assets/images/image1.png",
        date: "23 Mar"),
    AppointRequester(
        name: " ندي عبدالمنعم",
        appointmentType: "radiology",
        imageUrl: "assets/images/image1.png",
        date: "23 Mar"),
    AppointRequester(
        name: "هايدي حسن",
        appointmentType: "radiology",
        imageUrl: "assets/images/image1.png",
        date: "23 Mar"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue.shade900,
              automaticallyImplyLeading: false,
              flexibleSpace: SafeArea(
                  child: Row(children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      ////////////////لو احط ارو بيرجع
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 75.0),
                      child: Text(
                        ' المواعيد',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                 
                  ])),
            ),
            body:labModel!=null? StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("labs").doc(labModel!.labId)
                  .collection("appointments")
                  .orderBy("timeStamp")
                  .snapshots(),
              builder: (context, snapshot) {
                List<AppointmentModel> appointments=[];
                if(snapshot.hasData) {
                  for (var element in snapshot.data!.docs) {
                    appointments.add(AppointmentModel.fromJson(element.data() as Map<String,dynamic>));
                  }
                  return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 10,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: appointments.length,
                          itemBuilder: (context, index) {
                            return AppointList(
                              model: appointments[appointments.length-index-1],
                              isAppointmentRead:
                                  (index == 0 || index == 3) ? true : false,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
                }else{
                  return const Center(child: CircularProgressIndicator());
                }
              }
            ):
            const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
