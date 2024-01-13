import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ScanImage extends StatelessWidget {
  const ScanImage({
    super.key,
    required this.size,
    required this.image,
  });

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 250,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.width * 0.7,
            width: size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CachedNetworkImage(
              placeholder:(context, url) =>  const CircularProgressIndicator(),
              imageUrl: image,
              fit: BoxFit.fitWidth,
              height: 250,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}






//Rehaaaaaaaaaam