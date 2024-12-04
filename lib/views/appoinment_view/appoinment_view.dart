import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_healthcare_application/consts/consts.dart';
import 'package:e_healthcare_application/controllers/appointment_controller.dart';
import 'package:e_healthcare_application/res/components/custom_button.dart';
import 'package:e_healthcare_application/res/components/custom_textfield.dart';
import 'package:e_healthcare_application/views/appointment_details_view.details/appointment_details_view.dart';
import 'package:get/get.dart';

class AppoinmentView extends StatelessWidget {
  const AppoinmentView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blueColor,
          title: AppStyles.bold(
              title: "Appointments",
              color: AppColors.whiteColor,
              size: AppSizes.size18),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: controller.getAppointments(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var data = snapshot.data?.docs;

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                      itemCount: data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            Get.to(() => AppointmentDetailsView(
                                  doc: data[index],
                                ));
                          },
                          leading: CircleAvatar(
                            child: Image.asset(AppAssets.imgSignup),
                          ),
                          title: AppStyles.bold(
                              title: data![index]['appwithName']),
                          subtitle: AppStyles.normal(
                              title:
                                  "${data[index]['appDay']} - ${data[index]['appTime']}",
                              color: AppColors.textColor.withOpacity(0.5)),
                        );
                      }),
                );
              }
            }));
  }
}
