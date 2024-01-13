import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({Key? key, this.icon, this.color, this.onTap()?}) : super(key: key);
  Icon? icon;

  Color? color;
  Function()? onTap;
  //Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 60,
          // width: 160,
          decoration: BoxDecoration(
              color: color!, borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.all(16),
          child: Center(
            child: icon!,
          ),
        ),
      ),
    );
  }
}

class MyAdminButton extends StatefulWidget {
  MyAdminButton({Key? key, this.text, this.color, this.onTap()?})
      : super(key: key);
  Text? text;
  Color? color;
  Function()? onTap;

  @override
  State<MyAdminButton> createState() => _MyAdminButtonState();
}

class _MyAdminButtonState extends State<MyAdminButton> {
  //Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Container(
          height: 50,
          width: 160,
          decoration: BoxDecoration(
              color: widget.color!, borderRadius: BorderRadius.circular(25)),
          // padding: const EdgeInsets.all(4),
          child: Center(
            child: widget.text!,
          ),
        ),
      ),
    );
  }
}

class MyClick extends StatefulWidget {
  MyClick({Key? key, this.text, this.color, this.onTap()?}) : super(key: key);
  String? text;
  Color? color;
  Function()? onTap;

  @override
  State<MyClick> createState() => _MyClickState();
}

class _MyClickState extends State<MyClick> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Container(
          height: 42,
          width: 108,
          decoration: BoxDecoration(
              color: widget.color!, borderRadius: BorderRadius.circular(25)),
          // padding: const EdgeInsets.all(4),
          child: Center(
            child: Text(widget.text!,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'Archivo'),),
          ),
        ),
      ),
    );
  }
}
