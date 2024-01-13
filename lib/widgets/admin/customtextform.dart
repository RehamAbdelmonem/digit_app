import 'package:flutter/material.dart';

class CusTextForm extends StatelessWidget {
   final String? hint;
  final Widget? suffixicon;
   final String? Function(String?) valid;
   final TextEditingController? myController;
   final TextInputType? keyboardType;
   final bool? obsecureText;

  const CusTextForm({super.key, required this.hint,required this.myController, this.obsecureText, required this.valid, this.keyboardType, this.suffixicon});
  


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 10),
      child:TextFormField(
        keyboardType: keyboardType,
        controller:myController!,
        validator: valid,
        decoration: InputDecoration(
          suffixIcon: suffixicon,
          hintText:hint ,
          contentPadding: const EdgeInsets.symmetric(vertical:16,horizontal:10),
          border:const  OutlineInputBorder(
            borderSide: BorderSide(color:Colors.black,width:1),
            borderRadius:BorderRadius.all(Radius.circular(10)))),
           
      )
    );
  }
}