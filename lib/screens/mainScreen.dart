// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:foodies/navbar/cart/cart_page.dart';
import 'package:foodies/navbar/home/homepage.dart';
import 'package:foodies/navbar/profile/profile_page.dart';
import 'package:foodies/theme/style.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            currentIndex: currentPageIndex,
            selectedItemColor: primaryColorED6E1B,
            selectedLabelStyle: const TextStyle(color: primaryColorED6E1B),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded), label: "Account"),
            ]),
        body: _switchPageOnIndex(currentPageIndex));
  }

  _switchPageOnIndex(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const CartPage();
      case 2:
        return const ProfilePage();
    }
  }
}
