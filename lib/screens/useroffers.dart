// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/admin/offerItemwidget.dart';

import '../models/offer_model.dart';

class Useroffers extends StatefulWidget {
  late String labId;
   Useroffers(this.labId,{Key? key}) : super(key: key);

  @override
  State<Useroffers> createState() => _UseroffersState();
}

class _UseroffersState extends State<Useroffers> {
  Widget build(BuildContext context) {


    @override
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue.shade800,
            ),
            // drawer: NaviationDrawer(),
            backgroundColor: Colors.blue.shade800,
            body: SingleChildScrollView(
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: const Text(
                          ' العروض المتوفرة',
                          // textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("labs")
                        .doc(widget.labId)
                        .collection("offers")
                        .snapshots(),
                    builder: (context, snapshot) {
                      List<OfferModel> offers = [];
                      if (snapshot.hasData) {
                        for (var element in snapshot.data!.docs) {
                          offers.add(OfferModel.fromJson(
                              element.data() as Map<String, dynamic>));
                        }
                        return SizedBox(
                          width: size.height / 2,
                          height: size.width / 0.6,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: offers.length,
                            itemBuilder: (context, index) {
                              return OfferItems(
                                model: offers[index],

                              );
                            },
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
              ]),
            ),
          ),
        );
      },
    );
  }
}
