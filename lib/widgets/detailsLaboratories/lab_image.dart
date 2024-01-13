import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TestImage extends StatelessWidget {
  const TestImage({
    super.key,
    required this.size,
    required this.image,
  });

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 250,
      width: double.infinity,
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
