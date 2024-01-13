  import 'package:flutter/material.dart';
  Widget searchField(Size size, Color color,Color iconcolor,Color textcolor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.only(right: 16),
        height: size.height / 14,
        width: size.width / 1.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color),
        child: Row(
          children:  [
            Icon(Icons.search,color: iconcolor),
            const SizedBox(
              width: 1,
            ),
            Expanded(
                child: TextField(
              textAlign: TextAlign.start,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'بحث',hintStyle: TextStyle(color: textcolor)),
            )),
          ],
        ),
      ),
    );
  }