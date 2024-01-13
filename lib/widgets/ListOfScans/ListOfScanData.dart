import 'package:graduation_project/models/radiologyResult.dart';
import 'package:graduation_project/models/report_model.dart';
import 'package:graduation_project/models/testResult.dart';
import 'package:flutter/material.dart';

import '../../screens/RadiologyResult.dart';

class ListOfScansData extends StatelessWidget {
  const ListOfScansData(
      {Key? key,
      required this.model,
    })
      : super(key: key);

  final ReportModel model;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        // vertical: 10,
      ),
      height: 150.0,
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  RadiologyResult(
                    model:model,
                  ),
            ),
          );

        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 15),
                      blurRadius: 25,
                      color: Colors.black12),
                ],
              ),
            ),
            Positioned(
                bottom: 0.0,
                right: 0.0,
                child: SizedBox(
                  height: 136.0,
                  width: size.width - 200,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(model.labName,
                              style: TextStyle(
                                  color: Colors.blue.shade900, fontSize: 25)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(model.analysisName,
                              style: TextStyle(
                                  color: Colors.blue.shade900, fontSize: 20)),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                        ),
                      ]),
                ))
          ],
        ),
      ),
    );
  }
}






//Rehaaaaaaaaaam
