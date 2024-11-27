import 'package:e_healthcare_application/consts/consts.dart';
import 'package:e_healthcare_application/consts/lists.dart';
import 'package:e_healthcare_application/consts/strings.dart';
import 'package:e_healthcare_application/res/components/custom_button.dart';
import 'package:e_healthcare_application/res/components/custom_textfield.dart';
import 'package:e_healthcare_application/views/doctor_profile_view/doctor_profile_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppoinmentView extends StatelessWidget {
  const AppoinmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: AppStyles.bold(
            title: "Doctor Name",
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyles.bold(title: "Select appoinment day"),
              5.heightBox,
              CustomTextField(
                hint: "Select day",
                validator: (value) {
                  // Add your validation logic here
                  return null; // or return an error message
                },
              ),
              10.heightBox,
              AppStyles.bold(title: "Select appoinment time"),
              5.heightBox,
              CustomTextField(
                hint: "Select time",
                validator: (value) {
                  // Add your validation logic here
                  return null; // or return an error message
                },
              ),
              20.heightBox,
              AppStyles.bold(title: "Mobile Number"),
              5.heightBox,
              CustomTextField(
                hint: "Enter your mobile Number",
                validator: (value) {
                  // Add your validation logic here
                  return null; // or return an error message
                },
              ),
              10.heightBox,
              AppStyles.bold(title: "Full Name"),
              5.heightBox,
              CustomTextField(
                hint: "Enter your name",
                validator: (value) {
                  // Add your validation logic here
                  return null; // or return an error message
                },
              ),
              10.heightBox,
              AppStyles.bold(title: "Message"),
              5.heightBox,
              CustomTextField(
                hint: "Enter your message",
                validator: (value) {
                  // Add your validation logic here
                  return null; // or return an error message
                },
              ),
            ],
          ),
        ),
      ),
       bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: CustomButton(
          buttonText: "Book an appointment", 
          onTap: () {  },
          ),
      ),// Column
    );
  }
}
