import 'package:flutter/material.dart';
import 'package:foodies/theme/style.dart';

class GroceryAndFruitDetail extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  const GroceryAndFruitDetail({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  State<GroceryAndFruitDetail> createState() => _GroceryAndFruitDetailState();
}

class _GroceryAndFruitDetailState extends State<GroceryAndFruitDetail> {
  int itemsInCart = 0;
  addItem() {
    setState(() {
      itemsInCart = itemsInCart + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Colors.grey,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        // color: whiteColor,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      width: double.maxFinite,
                      child: Image.asset(
                        height: 200,
                        widget.image,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 8,
                    child: Container(
                      height: 35,
                      width: 122,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 220, 217, 217)
                              .withOpacity(0.8),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                itemsInCart = itemsInCart - 1;
                                if (itemsInCart < 0) {
                                  itemsInCart = 0;
                                }
                              });
                            },
                            child: Container(
                              // height: 25,
                              width: 30,
                              child: const Center(
                                child: Icon(Icons.remove),
                              ),
                            ),
                          ),
                          Container(
                            // height: 25,
                            width: 35,
                            color: primaryColorED6E1B,
                            child: Center(
                              child: Text(
                                itemsInCart.toString(),
                                style: TextStyle(color: whiteColor),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: addItem,
                            child: Container(
                              // height: 25,
                              width: 30,
                              child: const Center(
                                child: Icon(Icons.add),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: primaryColorED6E1B,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("4.5"),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          "Chicken breast, french fries, baked potato widgets."),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: primaryColorED6E1B,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("FREE delivery Sunday, October 23 2.00 PM"),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: primaryColorED6E1B,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Deliver to  New York 10001"),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: 30,
                    child: const Center(
                        child: Text(
                      "Total",
                      style: TextStyle(color: Colors.black87, fontSize: 12),
                    ))),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.white,
                        content: Center(
                            child: Text(
                          "Item added to the cart",
                          style: TextStyle(color: primaryColorED6E1B),
                        ))));

                    Future.delayed(const Duration(seconds: 1)).then((onValue) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    });
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 30,
                      decoration: BoxDecoration(
                          color: primaryColorED6E1B,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        "Add to cart",
                        style: TextStyle(color: whiteColor, fontSize: 12),
                      ))),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
