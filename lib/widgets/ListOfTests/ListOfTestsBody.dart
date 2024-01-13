import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/report_model.dart';
import 'package:graduation_project/models/testResult.dart';
import 'package:graduation_project/screens/TestResult.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/widgets/ListOfTests/ListOfTestsDate.dart';

class ListOfTestsBody extends StatelessWidget {
   ListOfTestsBody({super.key});
  List<ReportModel> reports=[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
              .collection("patient")
              .doc(patientModel!.uId)
              .collection("reports")
            .where("typeOfLab",isEqualTo: "laboratory")
              .snapshots(),
            builder: (context, snapshot) {
              reports=[];
              if(snapshot.hasData) {
                for (var element in snapshot.data!.docs) {
                  reports.add(ReportModel.fromJson(element.data() as Map<String,dynamic>));

                }
                return Expanded(
                  child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 70.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                  ),
                  ListView.builder(
                    itemCount: reports.length,
                    itemBuilder: (context, index) => ListOfTestsData(
                      model: reports[index],
                    ),
                  )
                ],
              ));
              }
              return const Center(child: CircularProgressIndicator());
            }
          )
        ],
      ),
    );
  }
}






//Rehaaaaaaaaaam
