import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodies/auth/sign_up_screen.dart';
import 'package:foodies/premium/premium_screen.dart';
import 'package:foodies/theme/style.dart';
import 'package:foodies/widgets/button_container_widget.dart';
import 'package:foodies/widgets/texfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 180,
                    ),
                    const Text(
                      textAlign: TextAlign.start,
                      "Log In",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TexfieldWidget(
                        name: "Email or Username", controller: emailController),
                    const SizedBox(
                      height: 15,
                    ),
                    TexfieldWidget(
                        name: "Password", controller: emailController),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                activeColor: primaryColorED6E1B,
                                value: value,
                                onChanged: onChanged),
                            const Text("Remember me"),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        const Text(
                          "Forget Password",
                          style: TextStyle(color: primaryColorED6E1B),
                        ),
                      ],
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
                        title: "Log In"),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialMediaWidget(FontAwesomeIcons.google, redColor),
                        const SizedBox(
                          width: 20,
                        ),
                        _socialMediaWidget(
                            FontAwesomeIcons.facebook, Colors.blue.shade900),
                        const SizedBox(
                          width: 20,
                        ),
                        _socialMediaWidget(
                            FontAwesomeIcons.linkedin, Colors.blue.shade600),
                      ],
                    ),
                  ],
                ),
              ],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                          (route) => false);
                    },
                    child: const Text(
                      "Create account?",
                      style: TextStyle(color: primaryColorED6E1B),
                    ))
              ],
            ),
          ],
        ),
      )),
    );
  }

  Widget _socialMediaWidget(IconData icon, Color backgroundColor) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(20)),
      child: Icon(
        icon,
        color: whiteColor,
      ),
    );
  }
}
