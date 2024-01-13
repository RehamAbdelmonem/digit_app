// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/admin/searchfield.dart';
import 'package:graduation_project/widgets/admin/itemwidget.dart';
import 'package:graduation_project/models/admin/dataClass.dart';

class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  List<Data> itemData = [
    Data(
        label: 'مراجعة\nمختص', imageUrl: 'assets/images/icons8-doctor-100.png'),
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
            appBar: AppBar(
              backgroundColor: Colors.blue.shade800,
            ),
            // drawer: NaviationDrawer(),
            backgroundColor: Colors.blue.shade800,
            body: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(height: 20),
                SizedBox(
                  width: size.width / 1.1,
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
                      Container(
                          width: 70,
                          child: Row(
                            children: [
                              // Expanded(
                              //   child: IconButton(
                              //     onPressed: () {
                              //       setState(() {
                              //           Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               const AddNewService()));
                              //       });
                              //     },
                              //     icon: Icon(Icons.edit),
                              //   ),
                              // ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    setState(
                                      () {},
                                    );
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: size.height / 16,
                // ),
                SizedBox(
                  width: size.height / 2.5,
                  height: size.width / 0.6,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: itemData.length,
                    itemBuilder: (context, index) {
                      return Items(
                        servlabel: itemData[index].label,
                        imageUrl: itemData[index].imageUrl,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: size.height / 16,
                ),
              ]),
            ),
          ),
        );
      },
    );
  }

//   Widget helpWidgetBuilder(Size size) {
//     return SizedBox(
//       width: size.height / 6,
//       height: size.width / 2.4,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: itemData.length,
//         itemBuilder: (context, index) {
//           return Items(servlabel:itemData[index].label ,imageUrl:itemData[index].imageUrl ,);
//         },
//       ),
//     );
//   }
}
