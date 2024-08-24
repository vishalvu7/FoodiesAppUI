import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodies/data/food_prime_data.dart';
import 'package:foodies/navbar/home/home_category/grocery_and_fruit/grocery_and_fruit_detail/grocery_and_fruit_detail.dart';
import 'package:foodies/screens/search/search_page.dart';
import 'package:foodies/theme/style.dart';
import 'package:foodies/widgets/search_widget.dart';

class GroceryAndFruitMainPage extends StatefulWidget {
  GroceryAndFruitMainPage({super.key});

  @override
  State<GroceryAndFruitMainPage> createState() =>
      _GroceryAndFruitMainPageState();
}

class _GroceryAndFruitMainPageState extends State<GroceryAndFruitMainPage> {
  TextEditingController searchController = TextEditingController();

  int _selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                SearchWidget(
                    controller: searchController,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchPage()));
                    }),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: primaryColorED6E1B),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.mic,
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 2,
                            height: 2,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Container(
                            width: 2,
                            height: 2,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Container(
                            width: 2,
                            height: 2,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
                alignment: Alignment.centerLeft, child: Text("Categories")),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                _singleCategoryItemWidget(context, onTap: () {
                  setState(() {
                    _selectedCategoryIndex = 0;
                  });
                },
                    color: _selectedCategoryIndex == 0
                        ? primaryColorED6E1B
                        : Colors.grey.withOpacity(0.8),
                    title: "Fruits"),
                const SizedBox(width: 15),
                _singleCategoryItemWidget(context, onTap: () {
                  setState(() {
                    _selectedCategoryIndex = 1;
                  });
                },
                    color: _selectedCategoryIndex == 1
                        ? primaryColorED6E1B
                        : Colors.grey.withOpacity(0.8),
                    title: "Vegetables"),
                const SizedBox(width: 15),
                _singleCategoryItemWidget(context, onTap: () {
                  setState(() {
                    _selectedCategoryIndex = 2;
                  });
                },
                    color: _selectedCategoryIndex == 2
                        ? primaryColorED6E1B
                        : Colors.grey.withOpacity(0.8),
                    title: "Kitchen")
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            _switchCategoryOnSelectedIndex(_selectedCategoryIndex)
          ],
        ),
      ),
    );
  }

  _switchCategoryOnSelectedIndex(int index) {
    switch (index) {
      case 0:
        {
          return _buildFruitsGridview();
        }
      case 1:
        {
          return _buildVegetablesGridview();
        }
      case 2:
        {
          return _buildKitchenGridview();
        }
    }
  }

  _buildFruitsGridview() {
    return Expanded(
        child: GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 1, crossAxisCount: 3, childAspectRatio: 0.8),
      children: FRUIT_CATEGORY_LIST.map((fruit) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GroceryAndFruitDetail(
                        image: fruit['image'].toString(),
                        title: fruit['title'].toString(),
                        price: fruit['price'].toString())));
          },
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("${fruit['image']}"),
                        fit: BoxFit.cover)
                    // color: primaryColorED6E1B
                    ),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          width: 50,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: redColor,
                          ),
                          child: Center(
                            child: Text(
                              "${fruit['price']}",
                              style: const TextStyle(color: whiteColor),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text("${fruit['title']}")
            ],
          ),
        );
      }).toList(),
    ));
  }

// Vegetables Category List

  _buildVegetablesGridview() {
    return Expanded(
        child: GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 1, crossAxisCount: 3, childAspectRatio: 0.8),
      children: VEGETABLE_CATEGORY_LIST.map((fruit) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GroceryAndFruitDetail(
                        image: fruit['image'].toString(),
                        title: fruit['title'].toString(),
                        price: fruit['price'].toString())));
          },
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("${fruit['image']}"),
                        fit: BoxFit.cover)
                    // color: primaryColorED6E1B
                    ),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          width: 50,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: redColor,
                          ),
                          child: Center(
                            child: Text(
                              "${fruit['price']}",
                              style: const TextStyle(color: whiteColor),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text("${fruit['title']}")
            ],
          ),
        );
      }).toList(),
    ));
  }

// Kitchen Category List
  _buildKitchenGridview() {
    return Expanded(
        child: GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 1, crossAxisCount: 3, childAspectRatio: 0.8),
      children: KITCHEN_CATEGORY_LIST.map((fruit) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GroceryAndFruitDetail(
                        image: fruit['image'].toString(),
                        title: fruit['title'].toString(),
                        price: fruit['price'].toString())));
          },
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("${fruit['image']}"),
                        fit: BoxFit.cover)
                    // color: primaryColorED6E1B
                    ),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          width: 50,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: redColor,
                          ),
                          child: Center(
                            child: Text(
                              "${fruit['price']}",
                              style: const TextStyle(color: whiteColor),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text("${fruit['title']}")
            ],
          ),
        );
      }).toList(),
    ));
  }

  _singleCategoryItemWidget(BuildContext context,
      {required VoidCallback onTap,
      required Color color,
      required String title}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 110,
          height: 45,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
