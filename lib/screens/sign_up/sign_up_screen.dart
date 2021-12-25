import 'package:feex/screens/sign_up/components/sign_up_body.dart';
import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  static String routeName = "/sign_up";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Body(),
    );
  }
}