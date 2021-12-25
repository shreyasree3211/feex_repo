import 'package:feex/components/socal_card.dart';
import 'package:feex/components/yes_account_text.dart';
import 'package:feex/screens/sign_up/components/sign_up_form.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        // width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%

                Image.asset(
                  'assets/images/frame_blue.png',
                  height: SizeConfig.screenHeight * 0.12,
                  width: SizeConfig.screenWidth * 0.6,
                ),

                // const Text("Feex .", style:  TextStyle(
                //   fontSize: 32
                // )),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                SignUpForm(),
                SizedBox(height:  SizeConfig.screenHeight * 0.04),
                YesAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}