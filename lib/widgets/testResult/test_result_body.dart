import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/report_model.dart';
import 'package:graduation_project/models/testResult.dart';
import 'package:graduation_project/screens/chats/app_images.dart';


class TestResultBody extends StatefulWidget {
   late String patientId;
   String? reportId;
   ReportModel? reportModel;
   TestResultBody({
    super.key,
     required this.patientId,
      this.reportId,
      this.reportModel,
  });

   Tresult tresult=Tresults[0];
  @override
  State<TestResultBody> createState() => _TestResultBodyState();
}

class _TestResultBodyState extends State<TestResultBody> {




  bool showContainer = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<DocumentSnapshot<Map<String,dynamic>>>(
          future:widget.reportId!=null? FirebaseFirestore.instance
              .collection("patient")
              .doc(widget.patientId)
              .collection("reports")
              .doc(widget.reportId).get():null,
          builder: (context, snapshot) {
            late ReportModel model;
            if(snapshot.hasData||widget.reportModel!=null) {
              if(snapshot.hasData) {
                model=ReportModel.fromJson(snapshot.data!.data()!);
              }else if(widget.reportModel!=null){
                model=widget.reportModel!;
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10.0),
                        Text(
                          'اسم المريض:  ${model.patientName}  ',
                          style: const TextStyle(
                            fontSize: 19.0, color: Colors.black,
                            //   fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'اسم الدكتور:  ${model.doctorName}  ',
                          style: const TextStyle(
                            fontSize: 19.0, color: Colors.black,
                            //   fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'تاريخ التحليل: ${model.date}',
                          style: const TextStyle(
                            fontSize: 19.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'نوع التحليل :  ${model.analysisName}',
                          style: const TextStyle(
                            fontSize: 19.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'اسم المعمل : ${model.labName} ',
                          style: const TextStyle(
                            fontSize: 19.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'نسبة التحاليل : ${model.analysisPercent}% ',
                          style: const TextStyle(
                            fontSize: 19.0,
                            color: Colors.black,
                          ),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  if(model.image.isNotEmpty&&model.image.contains("https"))
                  CachedNetworkImage(
                    placeholder:(context, url) =>  const Center(child: CircularProgressIndicator()),
                      imageUrl: model.image,
                    errorWidget: (context, url, error) => Image.asset(
                      AppImages.profile,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),

                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showContainer = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade800,
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "تقرير التحليل",
                        style: TextStyle(
                          fontSize: 22,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  showContainer
                      ? Container(
                    height: 180,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.blue.shade900,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      ' التقرير هو  : ${model.analysisReport} ',
                      style: const TextStyle(
                        fontSize: 22,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                      : Container(),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());

          }
        ),
      ),
    );
  }
}








//Rehaaaaaaaaaam
