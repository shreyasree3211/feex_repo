import 'dart:convert';

import 'package:feex/components/form_error.dart';
import 'package:feex/helper/keyboard.dart';
import 'package:feex/screens/forgot_password/reset_password_page.dart';
import 'package:feex/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? email;
  String? password;
  // bool? remember = false;
  bool _isLoading = false;

  login(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"email": email, "password": password};
    var jsonResponse;
    var res = await http.post(
        Uri.parse('https://feex.herokuapp.com/api/auth/login/'),
        body: body);
    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);

      print("Response status: ${res.statusCode}");
      print("Response status: ${res.body}");
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("access_token", jsonResponse['access']);
        Navigator.pushNamed(context, HomeScreen.routeName);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print("Response status: ${res.body}");
    }
  }

  // final List<String?> errors = [];

  // void addError({String? error}) {
  //   if (!errors.contains(error)) {
  //     setState(() {
  //       errors.add(error);
  //     });
  //   }
  // }
  //
  // void removeError({String? error}) {
  //   if (errors.contains(error)) {
  //     setState(() {
  //       errors.remove(error);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(fontSize: 16, color: greenColor
                      // decoration: TextDecoration.underline
                      ),
                ),
              )
            ],
          ),
          // FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.2),
          DefaultButton(
            text: "Log in",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                _emailController.text == "" || _passwordController.text == ""
                    ? null
                    : setState(() {
                        _isLoading = true;
                      });
                login(_emailController.text, _passwordController.text);
                // Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20)),

          // GestureDetector(
          //   onTap: (){
          //     print(" navigate to signup page");
          //     Navigator.pushNamed(context, SignUpScreen.routeName);},
          //   child: RichText(
          //     text: const TextSpan(
          //       // Note: Styles for TextSpans must be explicitly defined.
          //       // Child text spans will inherit styles from parent
          //       style: TextStyle(
          //         fontSize: 14.0,
          //         color: Colors.black,
          //       ),
          //       children: <TextSpan>[
          //         TextSpan(text: 'Don\'t Have an account?',style: TextStyle(
          //           color: lightBlueColor,
          //           fontSize: 16
          //         )),
          //         TextSpan(
          //             text: 'Join Now',
          //             style: TextStyle(
          //                 fontSize: 16,
          //                 color: greenColor, fontWeight: FontWeight.bold)),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        // if (value.isNotEmpty) {
        //   removeError(error: kPassNullError);
        // } else if (value.length >= 8) {
        //   removeError(error: kShortPassError);
        // }
        // return null;
      },
      validator: (value) {
        // if (value!.isEmpty) {
        //   addError(error: kPassNullError);
        //   return "";
        // } else if (value.length < 8) {
        //   addError(error: kShortPassError);
        //   return "";
        // }
        // return null;
      },
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightBlueColor, width: 1.0),
        ),
        hintText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        // if (value.isNotEmpty) {
        //   removeError(error: kEmailNullError);
        // } else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        // return null;
      },
      validator: (value) {
        // if (value!.isEmpty) {
        //   addError(error: kEmailNullError);
        //   return "";
        // } else if (!emailValidatorRegExp.hasMatch(value)) {
        //   addError(error: kInvalidEmailError);
        //   return "";
        // }
        // return null;
      },
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightBlueColor, width: 1.0),
        ),
        // labelText: "Email",
        hintText: "Username",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
