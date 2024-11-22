import 'package:e_healthcare_application/consts/images.dart';
import 'package:e_healthcare_application/res/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/strings.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(child: Image.asset(
            AppAssets.icLogin,
            width: 200,
            )),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.green,
                child: Form(
                  child: Column(
                  children: [
                    CustomTextField(hint: AppStrings.email),
                    10.heightBox,
                    CustomTextField(hint: AppStrings.password),
  
                  ]
                )),
            ))
          ],
        ),
      ),
    );
  }
}