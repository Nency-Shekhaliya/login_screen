import 'package:flutter/material.dart';
import 'package:login_screen/views/screens/login_page.dart';

void main() {
  runApp(My_Login_screen());
}

class My_Login_screen extends StatefulWidget {
  const My_Login_screen({Key? key}) : super(key: key);

  @override
  State<My_Login_screen> createState() => _My_Login_screenState();
}

class _My_Login_screenState extends State<My_Login_screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: My_Loginpage(),
    );
  }
}
