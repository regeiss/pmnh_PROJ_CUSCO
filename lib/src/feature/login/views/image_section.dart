import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
  super.key, 
  required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 340,
      height: 340,
      fit: BoxFit.scaleDown,
    );
  }
}