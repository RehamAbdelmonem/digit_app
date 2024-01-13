// // import 'dart:ffi';
// // class Messages {
// //   final String fname;
// //   final String lname;
// //   final String email;
// //   final String phone;
// //   final String address;
// //   final Int? age;
// //   Messages({required this.fname,required this.lname,required this.email,required this.phone,required this.address, this.age});
// // }
// import 'package:flutter/material.dart';

// class CustomCard extends StatelessWidget {
//   const CustomCard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircleAvatar(
//         radius: 25,
//       ),
//       title: Text('Radwa Gamal',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//       subtitle: Text('Bfcai', style: TextStyle(fontSize: 13)),
//       trailing: Text("3:20"),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:graduation_project/screens/appointDetailPage.dart';

import '../../models/appointment_model.dart';

class AppointList extends StatefulWidget {

  bool isAppointmentRead;
  late AppointmentModel model;

  AppointList(
      {Key? key,
      required this.model,
      required this.isAppointmentRead})
      : super(key: key);

  @override
  State<AppointList> createState() => _AppointListState();
}

class _AppointListState extends State<AppointList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AppointDetailPage(widget.model);
          }));
        },
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.model.image!),
            radius: 25,
          ),
          subtitle:Text(widget.model.type,
              style:
              const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          title: Text(widget.model.username,
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          trailing: Text(widget.model.dateOfAppointment),
        ));
  }
}
