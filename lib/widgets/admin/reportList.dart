/*
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/appointDetailPage.dart';
import 'package:graduation_project/screens/medicalreport.dart';

class ReportList extends StatefulWidget {
  String name;
  String labName;
  String imageUrl;
  String date;
 

  ReportList(
      {Key? key,
      required this.name,
      required this.labName,
      required this.imageUrl,
      required this.date,
      })
      : super(key: key);

  @override
  State<ReportList> createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return  Report(patientId: ,);
          }));
        },
        child: ListTile(
          
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
          leading: CircleAvatar(
            backgroundImage: AssetImage(widget.imageUrl),
            radius: 25,
          ),
          title: Text(widget.name,
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          subtitle: Text(widget.labName,
              style: const TextStyle(fontSize: 13)),
          trailing: Text(widget.date),
        ));
  }
}
*/
