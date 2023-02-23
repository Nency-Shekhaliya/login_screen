import 'package:flutter/material.dart';
import 'package:login_screen/utils/login_utils.dart';
import 'package:login_screen/views/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sign_up_Screen extends StatefulWidget {
  const Sign_up_Screen({Key? key}) : super(key: key);

  @override
  State<Sign_up_Screen> createState() => _Sign_up_ScreenState();
}

String setEmail = "Nouser";

class _Sign_up_ScreenState extends State<Sign_up_Screen> {
  Checkname() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      setEmail = pref.getString(SfEmail) ?? "No user";
    });
  }

  Deletaccount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setBool(Sflogin, false);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const My_Loginpage()));
    });
  }

  @override
  void initState() {
    super.initState();
    Checkname();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: const Color(0xff6a7801),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                "Log in as $setEmail",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: Deletaccount, child: const Text("Delete account"))
          ],
        ),
      ),
    );
  }
}
