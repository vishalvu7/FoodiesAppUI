import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodies/theme/style.dart';
import 'package:foodies/widgets/button_container_widget.dart';
import 'package:foodies/widgets/texfield_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Payment"),
          centerTitle: true,
          shadowColor: Colors.white10,
          elevation: 10,
          backgroundColor: Colors.white60,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Select Payment Method",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.28,
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      FontAwesomeIcons.ccMastercard,
                      color: primaryColorED6E1B,
                      size: 80,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.28,
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      FontAwesomeIcons.ccVisa,
                      color: primaryColorED6E1B,
                      size: 80,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.28,
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      FontAwesomeIcons.ccPaypal,
                      color: primaryColorED6E1B,
                      size: 80,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Card Number",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TexfieldWidget(
                  name: "Enter your card number",
                  controller: TextEditingController()),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Expiration Date",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TexfieldWidget(
                  name: "MM/YY/DD", controller: TextEditingController()),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Security Code",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TexfieldWidget(
                  name: "Enter your security code",
                  controller: TextEditingController()),
              const SizedBox(
                height: 30,
              ),
              ButtonContainerWidget(
                title: 'Order Now',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (builder) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.all(30),
                          shape: Border.all(width: 1),
                          title: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: primaryColorED6E1B, width: 2),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  size: 60,
                                  weight: 10,
                                  Icons.check_outlined,
                                  color: primaryColorED6E1B,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Order has been \nsuccessful",
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "You can track the delivery in the \nOrders Section",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ButtonContainerWidget(
                                title: "Continue Shopping",
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                fontSize: 12,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      });
                },
              )
            ],
          ),
        ));
  }
}
