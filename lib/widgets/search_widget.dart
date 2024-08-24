import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodies/theme/style.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback? onTap;
  final void Function(String)? onChanged;
  void Function(String)? onSubmit;
  SearchWidget(
      {super.key,
      required this.controller,
      this.onTap,
      this.onChanged,
      this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.withOpacity(0.1)),
        child: TextFormField(
          style: const TextStyle(fontSize: 14, height: 1.2),
          onTap: onTap,
          onChanged: onChanged,
          onFieldSubmitted: onSubmit,
          controller: controller,
          // cursorHeight: 16,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
              hintText: "Search your favorite",
              hintStyle: TextStyle(fontSize: 14),
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: primaryColorED6E1B,
              )),
        ),
      ),
    );
  }
}
