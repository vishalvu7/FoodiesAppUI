import 'package:flutter/material.dart';
import 'package:foodies/theme/style.dart';

class ButtonContainerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final String title;
  final VoidCallback? onTap;
  final bool? hasIcon;
  final IconData? icon;
  double? fontSize;
  ButtonContainerWidget(
      {super.key,
      this.width = double.infinity,
      this.height = 40,
      required this.title,
      this.onTap,
      this.hasIcon = false,
      this.icon,
      this.fontSize = 12});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: primaryColorED6E1B,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: hasIcon == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: whiteColor, fontSize: fontSize!),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      icon,
                      color: whiteColor,
                      size: 15,
                    ),
                  ],
                )
              : Text(
                  title,
                  style: TextStyle(color: whiteColor, fontSize: fontSize),
                ),
        ),
      ),
    );
  }
}
