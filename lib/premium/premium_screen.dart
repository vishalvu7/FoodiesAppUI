import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodies/screens/mainScreen.dart';
import 'package:foodies/theme/style.dart';
import 'package:foodies/widgets/button_container_widget.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Image.asset(
                  color: primaryColorED6E1B,
                  width: 60,
                  height: 60,
                  "assets/onboarding_logo.png"),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "The best of your \nneighbourhood,\ndelivered for less",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            _premiumScreenWidget(
                "Save an average of \$4 to 5 per order.", Icons.food_bank),
            const SizedBox(
              height: 15,
            ),
            _premiumScreenWidget(
                "Look for Foodies logo to find\n1k eligible restaurants.",
                Icons.restaurant),
            const SizedBox(
              height: 15,
            ),
            _premiumScreenWidget(
                "Enjoy zero delivery fees and reduced\nservice fees on order \$12",
                Icons.shopping_cart),
            const SizedBox(
              height: 15,
            ),
            _premiumScreenWidget(
                "Free 1 month trial, \$9.99 monthly\nafter, easily cancel anything",
                Icons.calendar_today),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonContainerWidget(title: "Try Foodies Free for 1 month"),
            const SizedBox(
              height: 35,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Mainscreen()),
                      (route) => false);
                },
                child: Text(
                  "Skip",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Expanded(
                child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(children: [
                TextSpan(
                    text: "By tapping the button, I agree to the ",
                    style: TextStyle(color: Colors.black87)),
                TextSpan(
                    text: "Terms ",
                    style: TextStyle(color: primaryColorED6E1B)),
                TextSpan(
                    text: "and an automatic monthly charge of \$9.99 untill i",
                    style: TextStyle(color: Colors.black87)),
                TextSpan(
                    text: " cancel.",
                    style: TextStyle(color: primaryColorED6E1B)),
                TextSpan(
                    text:
                        " Cancel in account prior to any renewal to avoid charges.",
                    style: TextStyle(color: Colors.black87)),
              ]),
            ))
          ],
        ),
      ),
    );
  }

  Widget _premiumScreenWidget(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: primaryColorED6E1B,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(title),
      ],
    );
  }
}
