import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/owner_model.dart';
import 'package:graduation_project/shared/components/constants.dart';

import '../../screens/DetailsCenter.dart';
import '../../screens/DetailsLaboratories.dart';
import '../detailsLaboratories/details_bodyLab.dart';

class Labs extends StatelessWidget {
  const Labs({
    Key? key,
    required this.lab,
  }) : super(key: key);

  final LabModel lab;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      height: 150.0,
      width: 150,
      child: InkWell(
        onTap: () {
          if((lab.laboratory!=null&&lab.laboratory!.isNotEmpty)
              ||((lab.laboratory!=null&&lab.laboratory!.isNotEmpty)
                  &&(lab.radiology!=null&&lab.radiology!.isNotEmpty))) {
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsLaboratories(
                lab: lab,
              ),
            ),
          );
          }else if(lab.radiology!=null&&lab.radiology!.isNotEmpty) {
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsLab(
                lab: lab,
              ),
            ),
          );
          }
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 100.0,
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
              // bottom: 0.0,
              // left: 0.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 150,
                width: 150,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Column(
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        imageUrl: lab.labImage,
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                        // fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      lab.labName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Rehaaaaaaaaaam
