import 'package:flutter/material.dart';
import 'package:foodies/navbar/home/home_category/food/food_main_page.dart';
import 'package:foodies/navbar/home/home_category/grocery_and_fruit/grocery_and_fruit_main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            _homeScreenCategoryWidget(context,
                title: "Grocery and Fruits",
                description:
                    "Order fresh vegetables and fruits anytime, anywhere.",
                image: "assets/fruits.png", onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GroceryAndFruitMainPage()));
            }),
            _homeScreenCategoryWidget(context,
                title: "Food",
                description:
                    "Order from your favorite restaurants and home chefs.",
                image: "assets/burger.png", onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FoodMainPage()));
            }),
          ],
        ),
      ),
    );
  }

  Widget _homeScreenCategoryWidget(BuildContext context,
      {required String title,
      required String description,
      required String image,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 1),
                  color: Colors.grey[350]!,
                  spreadRadius: 1.5,
                  blurRadius: 5.5)
            ]),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(description, style: const TextStyle(fontSize: 15))
                ],
              ),
            ),
            Image.asset(image, width: 100, height: 100)
          ],
        ),
      ),
    );
  }
}
