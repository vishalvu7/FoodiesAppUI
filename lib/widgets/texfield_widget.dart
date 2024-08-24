import 'package:flutter/material.dart';
import 'package:foodies/theme/style.dart';

class TexfieldWidget extends StatelessWidget {
  final String name;
  final double? width;
  final double? height;
  final double? fontSize;
  final TextEditingController controller;
  const TexfieldWidget(
      {super.key,
      required this.name,
      this.width = double.infinity,
      this.height = 50,
      this.fontSize = 14,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: name,
              hintStyle: TextStyle(fontSize: fontSize),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
