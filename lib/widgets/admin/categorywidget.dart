import 'package:flutter/material.dart';

///صفحة ال admin main => 4 widgets in center
class Category extends StatelessWidget {
  Category(
      {Key? key, this.text, this.color, this.onTap()?, this.child, this.image})
      : super(key: key);
  String? text;
  Color? color;
  Function()? onTap;
  Icon? child;
  String? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 125,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(image!), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(14),
            color: color),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        // child: Center(
        //   child: Text(
        //     text!,
        //     style: const TextStyle(color: Colors.white),
        //   ),
        // ),
      ),
    );
  }
}
//  Container(
//                         height: 100,
//                         width: 150,
//                         decoration: BoxDecoration(
//                             color: Colors.green.shade200,
//                             borderRadius: BorderRadius.circular(16)),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 20),
//                         child: Text('offers'),
//                       ),
