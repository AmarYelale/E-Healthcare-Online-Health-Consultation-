import 'package:e_healthcare_application/consts/consts.dart';
import 'package:e_healthcare_application/controllers/auth_controller.dart';
import 'package:e_healthcare_application/res/components/custom_button.dart';
import 'package:e_healthcare_application/res/components/custom_textfield.dart';
import 'package:e_healthcare_application/views/appoinment_view/appoinment_view.dart';
import 'package:e_healthcare_application/views/signup_view/signup_view.dart';
import 'package:e_healthcare_application/views/home_view/home.dart';
import 'package:get/get.dart'; // Make sure this import is present

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var isLoading = false;

  var isDoctor = false;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
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
                AppStyles.bold(
                    title: AppStrings.welcomeBack, size: AppSizes.size18),
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
                  CustomTextField(
                    hint: AppStrings.email,
                    textcontroller: controller.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  10.heightBox,
                  CustomTextField(
                    hint: AppStrings.password,
                    textcontroller: controller.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  10.heightBox,
                  SwitchListTile(
                      value: isDoctor,
                      onChanged: (newValue) {
                        setState(() {
                          isDoctor = newValue;
                        });
                      },
                      title: "Sign is as a doctor".text.make()),
                  20.heightBox,
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppStyles.normal(title: AppStrings.forgetPassword),
                  ),
                  20.heightBox,
                  CustomButton(
                      buttonText: AppStrings.login,
                      onTap: () async {
                        await controller.loginUser();
                        if (controller.userCredential != null) {
                          if (isDoctor) {
                            Get.to(() => AppoinmentView());
                          } else {
                            Get.to(() => const Home());
                          }
                        }
                      }),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppStyles.normal(title: AppStrings.dontHaveAccount),
                      8.widthBox,
                      GestureDetector(
                        onTap: () {
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
