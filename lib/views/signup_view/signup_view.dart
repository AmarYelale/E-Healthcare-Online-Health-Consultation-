import 'package:e_healthcare_application/consts/consts.dart';
import 'package:e_healthcare_application/consts/images.dart';
import 'package:e_healthcare_application/res/components/custom_button.dart';
import 'package:e_healthcare_application/res/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/strings.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        padding: const EdgeInsets.all(8),
        //child: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.imgSignup,
                  width: 200,
                ),
                10.heightBox,
                AppStyles.bold(title: AppStrings.signup, size: AppSizes.size18),
                AppStyles.bold(title: AppStrings.signupNow),

                // AppStrings.welcomeBack.text.make(),
                // AppStrings.weAreExcited.text.make(),
              ],
            ),
            30.heightBox,

            Expanded(
                child: Form(
                    child: SingleChildScrollView(
              child: Column(
                children: [
                   CustomTextField(hint: AppStrings.fullname),
                  10.heightBox,
                  CustomTextField(hint: AppStrings.email),
                  10.heightBox,
                  CustomTextField(hint: AppStrings.password),
                  20.heightBox,
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppStyles.normal(title: AppStrings.forgetPassword),
                  ),
                  20.heightBox,
                  CustomButton(buttonText: AppStrings.login, onTap: () {}),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppStyles.normal(title: AppStrings.dontHaveAccount),
                      8.widthBox,
                      AppStyles.bold(title: AppStrings.signup),
                       
                    ],
                  )
                ],
              ),
            )))
          ],
        ),
      ),
      //),
    );
  }
}