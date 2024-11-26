import 'package:e_healthcare_application/consts/consts.dart';
import 'package:e_healthcare_application/consts/images.dart';
import 'package:e_healthcare_application/res/components/custom_button.dart';
import 'package:e_healthcare_application/res/components/custom_textfield.dart';
import 'package:e_healthcare_application/views/home_view/home_view.dart';
import 'package:e_healthcare_application/views/signup_view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Make sure this import is present
import 'package:velocity_x/velocity_x.dart';

import '../../consts/strings.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                  AppAssets.icLogin,
                  width: 200,
                ),
                10.heightBox,
                AppStyles.bold(title: AppStrings.welcomeBack, size: AppSizes.size18),
                AppStyles.bold(title: AppStrings.weAreExcited),

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
                  CustomTextField(hint: AppStrings.email,
                   validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                }
                  return null;
                  },),
                  10.heightBox,
                  CustomTextField(hint: AppStrings.password,
                   validator: (value) {
               if (value == null || value.isEmpty) {
                 return 'Please enter your password';
                   } else if (value.length < 6) {
                     return 'Password must be at least 6 characters long';
                 }
              return null;
                  },),
                  20.heightBox,
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppStyles.normal(title: AppStrings.forgetPassword),
                  ),
                  20.heightBox,
                  CustomButton(buttonText: AppStrings.login, onTap: () {
                    Get.to(HomeView());
                  }),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppStyles.normal(title: AppStrings.dontHaveAccount),
                      8.widthBox,
                      GestureDetector(
                        onTap: (){
                         Get.to(() => const SignupView());
                        },

                     child: AppStyles.bold(title: AppStrings.signup),
                      )
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
