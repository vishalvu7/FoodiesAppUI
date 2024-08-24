import 'package:flutter/material.dart';
import 'package:foodies/screens/payment/payment_page.dart';
import 'package:foodies/theme/style.dart';
import 'package:foodies/widgets/button_container_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Image.asset(
            color: primaryColorED6E1B,
            width: 60,
            height: 60,
            "assets/onboarding_logo.png"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "2 items in the list cart",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  _cartPageWidget(context,
                      image: "assets/salmon.jpeg",
                      title: "Pizza",
                      desc: "Times Food",
                      price: "\$49"),
                  _cartPageWidget(context,
                      image: "assets/bbqburger.jpeg",
                      title: "Pizza",
                      desc: "Times Food",
                      price: "\$49")
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Items"),
                Text("2"),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Fee"),
                Text("\$0.00"),
              ],
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total"),
                Text("\$55.00"),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            ButtonContainerWidget(
              title: "Checkout",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentPage()));
              },
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  Widget _cartPageWidget(BuildContext context,
      {required String image,
      required String title,
      required String desc,
      required String price}) {
    return Container(
      width: double.infinity,
      height: 110,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 120,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Icon(
                          Icons.close,
                          color: primaryColorED6E1B,
                        ))
                  ],
                ),
                Text(desc),
                Text(price),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 0.5)),
                        child: const Icon(
                          Icons.remove,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "1",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 0.5)),
                        child: const Icon(
                          Icons.add,
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
