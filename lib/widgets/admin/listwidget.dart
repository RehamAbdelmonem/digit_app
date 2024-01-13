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
import 'package:graduation_project/screens/chatDetailPage.dart';
import 'package:graduation_project/models/admin/ModelClass.dart';
import 'package:graduation_project/screens/notificationDetail.dart';

class MyList extends StatefulWidget {
  Result child;
  Color? color;
  Icon? icon;
  MyList({required this.child, this.color, this.icon});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NotificatinDetailPage();
        }));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 230, 227, 227),
          borderRadius: BorderRadius.circular(3),
          shape: BoxShape.rectangle,
        ),
        //margin: const EdgeInsets.symmetric(vertical: 5.0),
        height: 120,
        child: ListTile(
          leading: CircleAvatar(
            child: widget.icon,
            backgroundColor: widget.color,
          ),
          title: Text(widget.child.name,
              style: TextStyle(color: Colors.blueGrey.shade800)),
          subtitle: Text(widget.child.url,
              style: TextStyle(color: Colors.blue.shade400)),
          trailing: const Text('0:00'),
        ),
      ),
    );
  }
}
