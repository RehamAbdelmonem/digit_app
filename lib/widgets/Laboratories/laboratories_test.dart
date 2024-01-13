import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/owner_model.dart';
import 'package:graduation_project/models/test.dart';
import 'package:graduation_project/screens/AppointmentTest.dart';

import '../../screens/DetailsLaboratories.dart';

class LaboratoriesList extends StatelessWidget {
  const LaboratoriesList(
      {Key? key,
      required this.itemIndex,
      required this.lab,})
      : super(key: key);

  final int itemIndex;
  final LabModel lab;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      height: 190.0,
      child: InkWell(
        onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailsLaboratories(lab:lab ),
              ),
            );

        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 166.0,
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
              left: 0.0,
              child:  ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    placeholder:(context, url) =>  const CircularProgressIndicator(),
                    imageUrl: lab.labImage,
                    fit: BoxFit.fitWidth,
                    width: 160,
                    height: 166,
                  )
              ),

            ),
            Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: SizedBox(
                    height: 160.0,
                    width: size.width - 200,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Text(lab.labName,
                                style: Theme.of(context).textTheme.headline5),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Text(lab.subTitle,
                                style: Theme.of(context).textTheme.headline6),
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
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>  AppointmentTest(lab),
                                    ),
                                  );
                                },
                                child: const Text(
                                  ' حدد موعد',
                                  style: TextStyle(
                                      color: Colors.white,
                                      // fontFamily: 'Archivo',
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}







//Rehaaaaaaaaaam
