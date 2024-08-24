import 'package:flutter/material.dart';
import 'package:foodies/auth/login_screen.dart';
import 'package:foodies/theme/style.dart';
import 'package:foodies/widgets/button_container_widget.dart';
import 'package:foodies/widgets/texfield_widget.dart';

import '../premium/premium_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool value = false;

  void onChanged(bool? newvalue) {
    setState(() {
      value = newvalue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 180,
                  ),
                  const Text(
                    textAlign: TextAlign.start,
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TexfieldWidget(
                      name: "Username", controller: usernameController),
                  const SizedBox(
                    height: 15,
                  ),
                  TexfieldWidget(name: "Email", controller: emailController),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TexfieldWidget(
                      name: "Password", controller: passwordController),
                  const SizedBox(
                    height: 15,
                  ),
                  TexfieldWidget(
                      name: "Phone number", controller: phoneController),
                  const SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: RichText(
                        maxLines: 2,
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "By signing up you accept the ",
                              style: TextStyle(
                                color: Colors.grey,
                              )),
                          TextSpan(
                              text: "Term of service",
                              style: TextStyle(color: primaryColorED6E1B)),
                          TextSpan(
                              text: "\nand ",
                              style: TextStyle(
                                color: Colors.grey,
                              )),
                          TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(color: primaryColorED6E1B))
                        ])),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonContainerWidget(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PremiumScreen()),
                            (route) => false);
                      },
                      title: "Sign Up"),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: Colors.black,
                      )),
                      SizedBox(
                        width: 15,
                      ),
                      Text("or"),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.black,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (route) => false);
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(color: primaryColorED6E1B),
                    ))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
