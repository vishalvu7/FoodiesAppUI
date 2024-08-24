import 'package:flutter/material.dart';
import 'package:foodies/onboarding/onboarding_entity.dart';
import 'package:foodies/auth/login_screen.dart';
import 'package:foodies/theme/style.dart';
import 'package:foodies/widgets/button_container_widget.dart';

// ignore: must_be_immutable
class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  List<OnboardingEntity> onboardingData = OnboardingEntity.onboardingItems;

  List<String> onboardingImg = [
    'free-shipping.png',
    'cash-on-delivery.png',
    'food-delivery.png'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: PageView.builder(
              itemCount: OnboardingEntity.onboardingItems.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                        color: primaryColorED6E1B,
                        width: 60,
                        height: 60,
                        "assets/onboarding_logo.png"),
                    const SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                        width: 200,
                        height: 200,
                        "assets/${onboardingData[index].image}"),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      onboardingData[index].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      onboardingData[index].description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == 0
                                  ? primaryColorED6E1B
                                  : Colors.grey),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == 1
                                  ? primaryColorED6E1B
                                  : Colors.grey),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == 2
                                  ? primaryColorED6E1B
                                  : Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    index == 2
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ButtonContainerWidget(
                              title: "Get Started",
                              hasIcon: true,
                              icon: Icons.arrow_forward_ios,
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()),
                                    (route) => false);
                              },
                            ),
                          )
                        : Container()
                  ],
                );
              })),
    );
  }
}
