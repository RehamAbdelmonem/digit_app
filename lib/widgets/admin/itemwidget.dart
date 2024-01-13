import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  const Items({Key? key, required this.imageUrl, required this.servlabel})
      : super(key: key);
  final String? imageUrl;
  final String? servlabel;
  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: size.height / 5,
          width: size.width / 3.5,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: size.height / 20,
                  width: size.width / 12,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.imageUrl!),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  widget.servlabel!,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

 