// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/newOffer.dart';
import 'package:graduation_project/widgets/admin/offerItemwidget.dart';

import 'package:graduation_project/widgets/admin/searchfield.dart';
import 'package:graduation_project/models/admin/dataClass.dart';

import '../models/offer_model.dart';
import '../shared/components/constants.dart';

class Myoffers extends StatefulWidget {
  const Myoffers({Key? key}) : super(key: key);

  @override
  State<Myoffers> createState() => _MyoffersState();
}

class _MyoffersState extends State<Myoffers> {
  Widget build(BuildContext context) {
    List<Data> offitemData = [
      Data(label: 'عرض الفحص الشامل', offercontent: ' 20% بخصم'),
      Data(label: 'عرض دخول المدارس', offercontent: ' 50% بخصم'),
      Data(label: 'عرض اطّمن', offercontent: ' 10% بخصم'),
      Data(label: 'عرض السكري', offercontent: ' 30% بخصم'),
      Data(label: 'عرض الفحوصات الدورية', offercontent: ' 20% بخصم')
    ];

    @override
    final size = MediaQuery
        .of(context)
        .size;
    // final width = MediaQuery.of(context).size.width;
    /////searchField variables
    final color = Colors.grey.shade200;
    final iconcolor = Colors.blue.shade900;
    final textcolor = Colors.blue.shade900;

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
              child: Column(
                  children: <Widget>[
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
                          SizedBox(
                              width: 120,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  const AddNewOffer()));
                                        });
                                      },
                                      icon: Row(
                                        children: [
                                          Text("أضافة عرض",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),),
                                          Icon(Icons.add, color: Colors.white70,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("labs")
                            .doc(labModel!.labId)
                            .collection("offers").snapshots(),
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
                                    model:offers[index],
                                  );
                                },
                              ),
                            );
                          }
                          return Center(child: CircularProgressIndicator());
                        }
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }

}

