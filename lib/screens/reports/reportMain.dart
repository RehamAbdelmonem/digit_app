import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/admin/reportfiles.dart';
import 'package:graduation_project/screens/reports/reports_list.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/widgets/admin/reportList.dart';

import '../../models/person.dart';
import '../TestResult.dart';
import '../chats/app_images.dart';
import '../medicalreport.dart';



class ReportPage extends StatefulWidget
{
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

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
                  condition: person.isNotEmpty,
                  builder:(context) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index)=>buildPersonItem(context, person[index]),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: person.length,
                    ),
                  ),
                  fallback:(context) =>Center(
                    child: isEmpty?const Text('Empty'): const CircularProgressIndicator(),
                  ),
                ),

              ));
        });
  }


  List<String> personIds = [];
  List<Person> person=[];
  bool isEmpty=false;
  late StreamSubscription streamPerson;

  @override
  void initState() {
    _getPersonsIds();
    super.initState();
  }
@override
  void dispose() {
  streamPerson.cancel();
  super.dispose();
  }
  void _getPersonsIds(){
    personIds=[];
 streamPerson= FirebaseFirestore.instance
        .collection("labs")
        .doc(labModel!.labId)
        .collection('chats')
        .snapshots()
        .listen((event) {
      for (var element in event.docs) {
        personIds.add(element.id);
      }
      _getPersons(personIds);
    });

  }
  void _getPersons(List<String> personIds){
    person=[];
    FirebaseFirestore.instance
        .collection("patient")
        .get()
        .then((value) {
        for (var doc in value.docs) {
          if (personIds.contains(doc.id)) {
            person.add(Person.fromPatientJson(doc.data()));
          }
      }
        if(person.isEmpty) {
          isEmpty=true;
        }

      setState(() {});
    });
  }


  Widget buildPersonItem(context,Person person,) =>
      InkWell(
        onTap:(){
          Navigator.push(
              context, MaterialPageRoute(builder:(context) =>ReportsList(
            patientId: person.uId,
            person: person,
          ) ,));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.cyan.shade800,
              radius: 35.0,
              child: ClipOval(
                child: person.image!=null&&person.image!.isNotEmpty
                    ?CachedNetworkImage(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: person.image!,
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
                      person.name,
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
                        builder: (context) =>  Report(person: person,patientId: person.uId,isEdit: false),));
                },
                child: const Text("اضافة تقرير"),
            ),
          ],
        ),
      );
}
