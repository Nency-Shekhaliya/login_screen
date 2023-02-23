import 'package:flutter/material.dart';
import 'package:login_screen/utils/login_utils.dart';
import 'package:login_screen/views/screens/signin_page.dart';
import 'package:login_screen/views/screens/sing_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class My_Loginpage extends StatefulWidget {
  const My_Loginpage({Key? key}) : super(key: key);

  @override
  State<My_Loginpage> createState() => _My_LoginpageState();
}

class _My_LoginpageState extends State<My_Loginpage> {
  bool loggin = false;

  Checkedlogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      loggin = pref.getBool(Sflogin) ?? false;

      if (loggin) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Sign_up_Screen()));
      }
    });
  }

  login() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      Emailcontroller.clear();
      Passcontroller.clear();
      setState(() {
        pref.setBool(Sflogin, true);
        pref.setString(SfEmail, Email!);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Signin_Page()));
      });
    }
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController Emailcontroller = TextEditingController(text: Email);
  TextEditingController Passcontroller = TextEditingController(text: password);
  @override
  void initState() {
    super.initState();
    Checkedlogin();
  }

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
                      "Create Account",
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
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
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
                              onTap: login,
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
                                  "Register",
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
