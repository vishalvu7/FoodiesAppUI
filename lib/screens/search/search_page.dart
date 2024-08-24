import 'package:flutter/material.dart';
import 'package:foodies/data/food_prime_data.dart';
import 'package:foodies/widgets/search_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  bool searchActive = false;

  List<Map<String, dynamic>> demo_search_food_data = [];

  filterSearch(String itemName) {
    if (itemName.isEmpty) {
      demo_search_food_data = SEARCH_FOOD_PRIME_DATA;
    } else {
      demo_search_food_data = SEARCH_FOOD_PRIME_DATA.where((data) {
        return data['title'].toString().toLowerCase().contains(itemName);
      }).toList();
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    demo_search_food_data = SEARCH_FOOD_PRIME_DATA;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const SizedBox(
                    width: 10,
                  ),
                  SearchWidget(
                    controller: searchController,
                    onTap: () {
                      setState(() {
                        searchActive = true;
                      });
                    },
                    onChanged: (value) {
                      filterSearch(value);
                    },
                    onSubmit: (item) {
                      searchActive = false;
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height * 0.6,
                child: demo_search_food_data.isNotEmpty
                    ? ListView.builder(
                        itemCount: demo_search_food_data.length,
                        itemBuilder: (context, index) {
                          String title =
                              demo_search_food_data[index]['title'].toString();
                          String image =
                              demo_search_food_data[index]['image'].toString();

                          double price = double.parse(
                              demo_search_food_data[index]['price'].toString());
                          return Container(
                            margin: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "$title",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        "\$$price",
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(image),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          );
                        })
                    : const Center(
                        child: Text("No Data Found..."),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
