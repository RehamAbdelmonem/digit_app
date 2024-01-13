// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/admin/dataClass.dart';
import 'package:graduation_project/models/offer_model.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/widgets/admin/itemwidget.dart';
import 'package:graduation_project/widgets/admin/offerItemwidget.dart';
import 'package:graduation_project/widgets/admin/searchfield.dart';

class MyServOffers extends StatefulWidget {
  const MyServOffers({Key? key}) : super(key: key);

  @override
  State<MyServOffers> createState() => _MyServOffersState();
}

class _MyServOffersState extends State<MyServOffers> {
  List<OfferModel> offers=[];

  List<Data> itemData = [
    Data(label: 'مراجعة\nمختص', imageUrl: 'assets/images/doctorhelp.png'),
    Data(label: 'وقاية\nمن العدوي', imageUrl: 'assets/images/infection.png'),
    Data(label: 'سلامة\nالعائلة', imageUrl: 'assets/images/family.png'),
    Data(label: 'الخط\nالساخن', imageUrl: 'assets/images/hotline.png'),
    Data(label: 'لا احتيال', imageUrl: 'assets/images/nowastedmoney.png')
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            // drawer: NaviationDrawer(),
            backgroundColor: Colors.blue.shade800,
            body: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(height: 40),
                SizedBox(
                  width: size.width / 0.6,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          ////////////////لو هشيل ال اب بار واحط ارو بيرجع بس
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                          child: Text(
                            'الخدمات\nو العروض',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 55.0),
                          child: const Image(
                            height: 110,
                            width: 135,
                            image: AssetImage('assets/images/srv.webp'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 26.0),
                  child: searchField(size, color, iconcolor, textcolor),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0, left: 140),
                        child: const Text(
                          'الخدمات المتاحة',
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
                SizedBox(
                  height: size.height / 16,
                ),
                SizedBox(
                  width: size.height,
                  height: size.width / 2.5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: itemData.length,
                    itemBuilder: (context, index) {
                      return Items(
                        servlabel: itemData[index].label,
                        imageUrl: itemData[index].imageUrl,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0, left: 140),
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
                 offers.isNotEmpty?SizedBox(
                      width: size.height / 1,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: offers.length,
                        itemBuilder: (context, index) {
                          return OfferItems(
                           model: offers[index],
                          );
                        },
                      ),
                    )
                     :Center(child: CircularProgressIndicator()),
              ]),
            ),
          ),
        );
      },
    );
  }
  @override
  void initState() {
    _getOffer();
    super.initState();
  }
  void _getOffer(){
    FirebaseFirestore.instance
        .collection("labs")
        .snapshots()
        .listen((event) {
      for (var element in event.docs) {
        FirebaseFirestore.instance
            .collection("labs")
            .doc(element.id)
            .collection("offers")
            .get().then((value){
          for (var element in value.docs) {
            offers.add(OfferModel.fromJson(element.data()));
            setState(() {});
          }

        });      }

    });

  }
}
