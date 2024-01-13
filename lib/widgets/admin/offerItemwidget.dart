import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/offer_model.dart';
import 'package:graduation_project/shared/components/constants.dart';

import '../../screens/admin_offers.dart';

class OfferItems extends StatefulWidget {
 late OfferModel model;
   OfferItems(
      {Key? key,
      required this.model,})
      : super(key: key);


  @override
  State<OfferItems> createState() => _OfferItemsState();
}

class _OfferItemsState extends State<OfferItems> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: size.width / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: ListTile(
                  title: Text(
                    widget.model.name,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Archivo'),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.model.offer,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Archivo',
                            color: Color.fromARGB(255, 164, 40, 40)),
                      ),
                      Text(
                        widget.model.description??"",
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Archivo',
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "من ${widget.model.startDate}",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Archivo',
                                color: Colors.black87),
                          ),
                          Text(
                            "  الي ${widget.model.endDate}",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Archivo',
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing:labModel!=null? IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('تأكيدٍ'),
                            content: Text("هل تريد حذف العرض"),
                            actions: [
                              TextButton(
                                child: Text('حذف'),
                                onPressed: () {
                                  FirebaseFirestore.instance
                                  .collection("labs")
                                  .doc(labModel!.labId)
                                  .collection("offers")
                                  .doc(widget.model.id)
                                  .delete();
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ));
                    },
                    icon: Icon(Icons.delete,color: Colors.red,),
                  ):null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
