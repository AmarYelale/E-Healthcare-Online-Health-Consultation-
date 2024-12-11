import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_healthcare_application/consts/consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var searchQueryController = TextEditingController();
  var isLoading = false.obs;

  Future<QuerySnapshot<Map<String, dynamic>>> getDoctorList() {
    isLoading(true);
    var doctors = FirebaseFirestore.instance.collection('doctors').get();
    return doctors;
  }
}
