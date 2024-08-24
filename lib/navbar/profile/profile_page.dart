import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodies/theme/style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: whiteColor,
        shadowColor: lightGreyColor,
        elevation: 10,
        title: Image.asset(
            color: primaryColorED6E1B,
            width: 60,
            height: 60,
            "assets/onboarding_logo.png"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage("assets/profilepic.jpeg"),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "John Smith",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              height: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            _accountProfileWidget(context,
                leading: Icons.language,
                title: "Language",
                trailing: Icons.arrow_forward_ios),
            const SizedBox(
              height: 15,
            ),
            _accountProfileWidget(context,
                leading: Icons.help,
                title: "Help",
                trailing: Icons.arrow_forward_ios),
            const SizedBox(
              height: 15,
            ),
            _accountProfileWidget(context,
                leading: Icons.light_mode_outlined,
                title: "Theme",
                trailing: Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }

  Widget _accountProfileWidget(BuildContext context,
      {required IconData leading,
      required String title,
      required IconData trailing}) {
    return Container(
      width: double.infinity,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.2)),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(leading),
                const SizedBox(
                  width: 10,
                ),
                Text(title)
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
