import 'package:flutter/material.dart';
import 'package:login_screen/views/screens/sing_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/login_utils.dart';

class Signin_Page extends StatefulWidget {
  const Signin_Page({Key? key}) : super(key: key);

  @override
  State<Signin_Page> createState() => _Signin_PageState();
}

class _Signin_PageState extends State<Signin_Page> {
  bool signin = false;
  Checkedsignin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      signin = pref.getBool(sfsignin) ?? false;

      if (signin) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Sign_up_Screen()));
      }
    });
  }

  Signin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      setState(() {
        pref.setBool(sfsignin, true);
        pref.setString(SfEmail, Email!);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Sign_up_Screen()));
      });
    }
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController Emailcontroller = TextEditingController(text: Email);
  TextEditingController Passcontroller = TextEditingController(text: password);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Color(0xff6a7801)),
                    ),
                  )),
              Expanded(
                flex: 8,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Form(
                      key: formkey,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: Emailcontroller,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              onChanged: (val) {
                                Email = val;
                              },
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please Enter Details...";
                                } else {
                                  return null;
                                }
                              },
                              cursorColor: const Color(0xff6a7801),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Color(0xff6a7801),
                                      width: 1.5,
                                    )),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.grey,
                                ),
                                label: Text(
                                  "Email",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: Passcontroller,
                              obscureText: true,
                              onSaved: (val) {
                                setState(() {
                                  password = val;
                                });
                              },
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please Enter Details...";
                                } else {
                                  return null;
                                }
                              },
                              cursorColor: const Color(0xff6a7801),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Color(0xff6a7801),
                                      width: 1.5,
                                    )),
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.grey,
                                ),
                                label: Text(
                                  "Password",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: Signin,
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                height: 40,
                                width: 300,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: const Color(0xff6a7801),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: "Already have account ?"),
                                  TextSpan(
                                      text: " Sign in",
                                      style: TextStyle(
                                        color: Color(0xff6a7801),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.lightGreen.shade200,
    );
  }
}
