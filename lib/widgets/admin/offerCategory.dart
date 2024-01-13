import 'package:flutter/material.dart';


class MyoffersCategory extends StatelessWidget {
  final String? name;
  final String? labName;
  final String? image;
  final Color? color;
  const MyoffersCategory({this.name, this.labName, this.image,this.color});
  


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding:const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top:20),
      decoration:BoxDecoration(color:color,
      shape: BoxShape.circle,
      boxShadow: const [
                  BoxShadow(
                      blurRadius: 32, color: Colors.black45, spreadRadius: -8)
                ],
                borderRadius: BorderRadius.circular(16)),
      // image: DecorationImage(image: AssetImage(image!),fit:BoxFit.cover)),
      child: ListTile(
        leading: CircleAvatar(foregroundImage: AssetImage(image!)),
        title: Text('$name\n$labName'),
        trailing:Row(children: const [

        ]) ,
      ),
    );
  }
}
