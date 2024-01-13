import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  BigButton({Key? key, this.text, this.color, this.onTap()?}) : super(key: key);
  Text? text;
  Color? color;
  Function()? onTap;
  // Icon? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
              color: color!, borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.all(12),
          child: Center(
            child: text!,
          ),
        ),
      ),
    );
  }
}
