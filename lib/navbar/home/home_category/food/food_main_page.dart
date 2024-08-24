import 'package:flutter/material.dart';
import 'package:foodies/data/food_prime_data.dart';
import 'package:foodies/screens/search/search_page.dart';
import 'package:foodies/theme/style.dart';
import 'package:foodies/widgets/search_widget.dart';

class FoodMainPage extends StatefulWidget {
  const FoodMainPage({super.key});

  @override
  State<FoodMainPage> createState() => _FoodMainPageState();
}

class _FoodMainPageState extends State<FoodMainPage> {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      title: "Burger"),
                  SizedBox(width: 15),
                  _singleCategoryItemWidget(context, onTap: () {
                    setState(() {
                      _selectedCategoryIndex = 1;
                    });
                  },
                      color: _selectedCategoryIndex == 1
                          ? primaryColorED6E1B
                          : Colors.grey.withOpacity(0.8),
                      title: "Pizza"),
                  SizedBox(width: 15),
                  _singleCategoryItemWidget(context, onTap: () {
                    setState(() {
                      _selectedCategoryIndex = 2;
                    });
                  },
                      color: _selectedCategoryIndex == 2
                          ? primaryColorED6E1B
                          : Colors.grey.withOpacity(0.8),
                      title: "Sandwitch")
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Today Special Offer",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              _switchSpecialCategoryOnSelectedIndex(_selectedCategoryIndex),
              SizedBox(
                height: 15,
              ),
              Text(
                "Popular Now",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              _switchPoularCategoryOnSelectedIndex(_selectedCategoryIndex)
            ],
          ),
        ),
      ),
    );
  }

  _switchSpecialCategoryOnSelectedIndex(int index) {
    switch (index) {
      case 0:
        {
          return _buildSpecialBurgerList();
        }
      case 1:
        {
          return _buildSpeciaPizzaList();
        }
      case 2:
        {
          return _buildSpecialSandwitchList();
        }
    }
  }

  _buildSpecialBurgerList() {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: BURGER_SPECIAL_CATEGORY_LIST.map((specialpizza) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 200,
                width: 280,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "${specialpizza['image']}",
                        ),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${specialpizza['title']}",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text("\$${specialpizza['price']} Delivery Fee 20-40 min",
                          style: const TextStyle(fontSize: 12))
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Container(
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        shape: BoxShape.circle),
                    child: const Center(
                      child: Text("4.5"),
                    ),
                  )
                ],
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  _buildSpeciaPizzaList() {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: PIZZA_SPECIAL_CATEGORY_LIST.map((specialpizza) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 200,
                width: 280,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "${specialpizza['image']}",
                        ),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${specialpizza['title']}",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text("\$${specialpizza['price']} Delivery Fee 20-40 min",
                          style: const TextStyle(fontSize: 12))
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Container(
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        shape: BoxShape.circle),
                    child: const Center(
                      child: Text("4.5"),
                    ),
                  )
                ],
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  _buildSpecialSandwitchList() {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: SANDWICH_SPECIAL_CATEGORY_LIST.map((specialpizza) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 200,
                width: 280,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "${specialpizza['image']}",
                        ),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${specialpizza['title']}",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text("\$${specialpizza['price']} Delivery Fee 20-40 min",
                          style: const TextStyle(fontSize: 12))
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Container(
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        shape: BoxShape.circle),
                    child: const Center(
                      child: Text("4.5"),
                    ),
                  )
                ],
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  _switchPoularCategoryOnSelectedIndex(int index) {
    switch (index) {
      case 0:
        {
          return _buildPopularBurgerList();
        }
      case 1:
        {
          return _buildPopularPizzaList();
        }
      case 2:
        {
          return _buildPopularSandwitchList();
        }
    }
  }

  _buildPopularBurgerList() {
    return SizedBox(
      height: 260,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: BURGER_POPULAR_CATEGORY_LIST.map((specialpizza) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 150,
                width: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "${specialpizza['image']}",
                        ),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                              color: redColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Text(
                              "\$${specialpizza['price']}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 120,
                    // color: Colors.amber,
                    child: Text(
                      "${specialpizza['title']}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.clip),
                    ),
                  ),
                  Container(
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        shape: BoxShape.circle),
                    child: const Center(
                      child: Text("4.5"),
                    ),
                  )
                ],
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  _buildPopularPizzaList() {
    return SizedBox(
      height: 260,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: PIZZA_POPULAR_CATEGORY_LIST.map((specialpizza) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 150,
                width: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "${specialpizza['image']}",
                        ),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                              color: redColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Text(
                              "\$${specialpizza['price']}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 120,
                    // color: Colors.amber,
                    child: Text(
                      "${specialpizza['title']}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.clip),
                    ),
                  ),
                  Container(
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        shape: BoxShape.circle),
                    child: const Center(
                      child: Text("4.5"),
                    ),
                  )
                ],
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  _buildPopularSandwitchList() {
    return SizedBox(
      height: 260,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: SANDWICH_POPULAR_CATEGORY_LIST.map((specialpizza) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 150,
                width: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "${specialpizza['image']}",
                        ),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                              color: redColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Text(
                              "\$${specialpizza['price']}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 120,
                    // color: Colors.amber,
                    child: Text(
                      "${specialpizza['title']}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.clip),
                    ),
                  ),
                  Container(
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        shape: BoxShape.circle),
                    child: const Center(
                      child: Text("4.5"),
                    ),
                  )
                ],
              ),
            ],
          );
        }).toList(),
      ),
    );
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
              style: const TextStyle(color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
