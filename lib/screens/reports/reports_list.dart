import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/report_model.dart';
import 'package:graduation_project/shared/components/constants.dart';

import '../../models/person.dart';
import '../TestResult.dart';
import '../chats/app_images.dart';
import '../medicalreport.dart';



class ReportsList extends StatefulWidget
{
  late String patientId;
  late Person person;
   ReportsList({required this.patientId,required this.person,super.key});

  @override
  State<ReportsList> createState() => _ReportsListState();
}

class _ReportsListState extends State<ReportsList> {

  @override
  Widget build(BuildContext context) {
    if(streamPerson.isPaused){
      streamPerson.resume();
    }
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
                        ' التقارير الطبية',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ])),
                ),
                body: ConditionalBuilder(
                  condition: reports.isNotEmpty,
                  builder:(context) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index)=>buildReportsItem(context, reports[index]),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: reports.length,
                    ),
                  ),
                  fallback:(context) =>Center(
                    child: isEmpty?const Text('Empty'): const CircularProgressIndicator(),
                  ),
                ),

              ));
        });
  }


  List<ReportModel> reports=[];
  bool isEmpty=false;
  late StreamSubscription streamPerson;

  @override
  void initState() {
    _getReports();
    super.initState();
  }
@override
  void dispose() {
  streamPerson.cancel();
  super.dispose();
  }
  void _getReports(){
    reports=[];
 streamPerson= FirebaseFirestore.instance
        .collection("patient")
        .doc(widget.patientId)
        .collection('reports')
          .where("labId",isEqualTo: labModel!.labId)
        .snapshots()
        .listen((event) {
      for (var element in event.docs) {
        reports.add(ReportModel.fromJson(element.data()));
      }
      setState(() {

      });
    });
if(reports.isEmpty){
  isEmpty=true;
  setState(() {

  });
}

  }


  Widget buildReportsItem(context,ReportModel report,) =>
      InkWell(
        onTap:(){
          Navigator.push(
              context, MaterialPageRoute(builder:(context) =>TestResult(
            patientId: widget.patientId,
            reportId: report.id,
          ) ,));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.cyan.shade800,
              radius: 35.0,
              child: ClipOval(
                child: report.image.isNotEmpty
                    ?CachedNetworkImage(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: widget.person.image!,
                  errorWidget: (context, url, error) => Image.asset(
                    AppImages.profile,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
                    :Image.asset(AppImages.profile,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      report.patientName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) =>  Report(
                              reportModel: report,
                            person: widget.person,patientId: widget.patientId,isEdit: true),));
                },
                child: const Text("تعديل تقرير"),
            ),
          ],
        ),
      );
}
