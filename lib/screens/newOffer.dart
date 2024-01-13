import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/offer_model.dart';
import '../shared/components/constants.dart';

class AddNewOffer extends StatefulWidget {
  const AddNewOffer({Key? key}) : super(key: key);

  @override
  State<AddNewOffer> createState() => _AddNewOfferState();
}

class _AddNewOfferState extends State<AddNewOffer> {
  var formKey = GlobalKey<FormState>();
  var secformKey = GlobalKey<FormState>();


  final TextEditingController _name = TextEditingController();
  final TextEditingController _offer = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _startdate = TextEditingController();
  final TextEditingController _enddate = TextEditingController();




  @override
  Widget build(BuildContext context) {
    _name.text=labModel!.labName;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue.shade900,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Text(
                                'عرض جديد',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Archivo',
                                  color: Color.fromARGB(248, 61, 116, 233),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        TextFormField(
                          controller: _name,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: "اسم المعمل",
                            hintText: "الاسم",
                            labelStyle:
                                TextStyle(fontSize: 24, color: Colors.black),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _offer,
                          decoration: const InputDecoration(
                            labelText: "العرض",
                            hintText: "الاسم",
                            labelStyle:
                                TextStyle(fontSize: 24, color: Colors.black),
                          ),
                          keyboardType: TextInputType.name,

                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _description,
                          decoration: const InputDecoration(
                            labelText: "وصف العرض",
                            hintText: "الاسم",
                            labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                          ),
                          keyboardType: TextInputType.name,

                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _startdate,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickkeddate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2023),
                                    lastDate: DateTime(2053))
                                .then((value) {
                              setState(() {
                                _startdate.text = "${value!.year}/${value.month}/${value.day}";
                              });
                            }).onError((error, stackTrace) => null);
                          },
                          decoration: const InputDecoration(
                            labelText: "تاريخ بداية العرض",
                            prefixIcon: Icon(
                              Icons.date_range_outlined,
                              color: Colors.blue,
                            ),
                            labelStyle:
                                TextStyle(fontSize: 24, color: Colors.black),
                          ),
                        
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _enddate,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickkeddate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2023),
                                    lastDate: DateTime(2053)) .then((value) {
                              setState(() {
                                _enddate.text = "${value!.year}/${value.month}/${value.day}";
                              });
                            }).onError((error, stackTrace) => null);;
                               
                          },
                          decoration: const InputDecoration(
                            labelText: "تاريخ انتهاء العرض",
                            prefixIcon: Icon(
                              Icons.date_range_outlined,
                              color: Colors.blue,
                            ),
                            // hintText: "تاريخ",
                            labelStyle:
                                TextStyle(fontSize: 24, color: Colors.black),
                          ),
                         
                        ),
                        const SizedBox(
                          height: 55,
                        ),
                        const SizedBox(height: 25),
                                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: Material(
                     borderRadius: BorderRadius.circular(12),
                    color: Colors.blue.shade900,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                             builder: (context) => AlertDialog(
                                  title: const Text('رسالة تأكيد'),
                                  content: const Text(" تمت إضافة عرض جديد "),
                                  actions: [
                                    TextButton(
                                      child: const Text('موافق'),
                                      onPressed: () {
                                        if(formKey.currentState!.validate()) {
                                          _addOffer();
                                        }
                                      },
                                    ),
                                   ],
                                ));
                      },
                      child: const Center(
                        child: Text(
                          "إضافة",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _addOffer() {
    OfferModel offerModel = OfferModel(
        id: "0",
        name: _name.text,
        offer: _offer.text,
        description: _description.text,
        startDate: _startdate.text,
        endDate: _enddate.text,
        labId: labModel!.labId,
    );
   FirebaseFirestore.instance
        .collection("labs")
        .doc(labModel!.labId)
        .collection("offers")
        .add(offerModel.toMaP())
        .then((value){
      FirebaseFirestore.instance
          .collection("labs")
          .doc(labModel!.labId)
          .collection("offers")
      .doc(value.id)
      .update({"id":value.id}).then((value){
        Navigator.pop(context);
        Navigator.pop(context);
      });

    });

  }

}
