import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/radiologyResult.dart';
import 'package:graduation_project/models/report_model.dart';

class RadiologyResultBody extends StatefulWidget {
  final ReportModel model;
  const RadiologyResultBody({super.key, required this.model});

  @override
  State<RadiologyResultBody> createState() => _RadiologyResultBodyState();
}

class _RadiologyResultBodyState extends State<RadiologyResultBody> {
  bool showContainer = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                    'اسم المريض:  ${widget.model.patientName}  ',
                    style: const TextStyle(
                      fontSize: 19.0, color: Colors.black,
                      //   fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'اسم الدكتور:  ${widget.model.doctorName}  ',
                    style: const TextStyle(
                      fontSize: 19.0, color: Colors.black,
                      //   fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'تاريخ الأشعة: ${widget.model.date}',
                    style: const TextStyle(
                      fontSize: 19.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'نوع الأشعة :  ${widget.model.analysisName}',
                    style: const TextStyle(
                      fontSize: 19.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'اسم المركز : ${widget.model.labName} ',
                    style: const TextStyle(
                      fontSize: 19.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'نسبة التحاليل : ${widget.model.analysisPercent}% ',
                    style: const TextStyle(
                      fontSize: 19.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            CachedNetworkImage(
              placeholder:(context, url) =>  const Center(child: CircularProgressIndicator()),
              imageUrl: widget.model.image,

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
                  "تقرير الأشعة",
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
                      ' التقرير هو  : ${widget.model.analysisReport} ',
                      style: const TextStyle(
                        fontSize: 22,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}






//Rehaaaaaaaaaam
