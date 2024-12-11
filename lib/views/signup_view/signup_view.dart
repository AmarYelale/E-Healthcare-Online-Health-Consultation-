import 'package:e_healthcare_application/consts/consts.dart';
import 'package:e_healthcare_application/controllers/auth_controller.dart';
import 'package:e_healthcare_application/res/components/custom_button.dart';
import 'package:e_healthcare_application/res/components/custom_textfield.dart';
import 'package:e_healthcare_application/views/home_view/home.dart';
import 'package:get/get.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});
  @override
  State<StatefulWidget> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
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
                  AppAssets.imgSignup,
                  width: 200,
                ),
                10.heightBox,

                AppStyles.bold(
                    title: AppStrings.signupNow,
                    size: AppSizes.size18,
                    alignment: TextAlign.center),

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
                    hint: AppStrings.fullname,
                    textcontroller: controller.fullnameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your fullname';
                      }
                      return null;
                    },
                  ),
                  10.heightBox,
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
                      title: "Sign up as a doctor".text.make(),
                      value: isDoctor,
                      onChanged: (newValue) {
                        setState(() {
                          isDoctor = newValue;
                        });
                      }),
                  Visibility(
                    visible: isDoctor,
                    child: Column(children: [
                      CustomTextField(
                        hint: "About",
                        textcontroller: controller.aboutController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your About';
                          }
                          return null;
                        },
                      ),
                      10.heightBox,
                      CustomTextField(
                        hint: "Category",
                        textcontroller: controller.categoryController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your category';
                          }
                          return null;
                        },
                      ),
                      10.heightBox,
                      CustomTextField(
                        hint: "Service",
                        textcontroller: controller.servicesController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your services';
                          }
                          return null;
                        },
                      ),
                      10.heightBox,
                      CustomTextField(
                        hint: "Address",
                        textcontroller: controller.addressController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Address';
                          }
                          return null;
                        },
                      ),
                      10.heightBox,
                      CustomTextField(
                        hint: "Phone Number",
                        textcontroller: controller.phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      10.heightBox,
                      CustomTextField(
                        hint: "Timing",
                        textcontroller: controller.timingController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your timing';
                          }
                          return null;
                        },
                      ),
                      10.heightBox,
                    ]),
                  ),
                  20.heightBox,
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppStyles.normal(title: AppStrings.forgetPassword),
                  ),
                  20.heightBox,
                  CustomButton(
                      buttonText: AppStrings.signup,
                      onTap: () async {
                        await controller.signupUser(isDoctor);
                        if (controller.userCredential != null) {
                          Get.offAll(() => const Home());
                        }
                      }),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppStyles.normal(title: AppStrings.alreadyHaveAccount),
                      8.widthBox,
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: AppStyles.bold(title: AppStrings.login),
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
