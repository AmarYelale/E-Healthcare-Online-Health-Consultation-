//var controller = Get.put(AppointmentController());//import 'package:e_healthcare_application/consts/consts.dart';
import 'package:e_healthcare_application/consts/consts.dart';
import 'package:e_healthcare_application/controllers/appointment_controller.dart';
import 'package:e_healthcare_application/res/components/custom_button.dart';
import 'package:e_healthcare_application/res/components/custom_textfield.dart';
import 'package:get/get.dart';

class BookAppointmentView extends StatelessWidget {
  final String docId;
  final String docName;
  const BookAppointmentView(
      {super.key, required this.docId, required this.docName});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: AppStyles.bold(
            title: docName, color: AppColors.whiteColor, size: AppSizes.size18),
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
                textcontroller: controller.appDayController,
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
                textcontroller: controller.appTimeController,
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
                textcontroller: controller.appNameController,
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
                textcontroller: controller.appNameController,
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
                textcontroller: controller.appMessageController,
                validator: (value) {
                  // Add your validation logic here
                  return null; // or return an error message
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(10),
          child: controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CustomButton(
                  buttonText: "Book an appointment",
                  onTap: () async {
                    await controller.bookAppointment(docId, docName,context);
                    Get.back();
                  },
                ),
        ),
      ), // Column
    );
  }
}
