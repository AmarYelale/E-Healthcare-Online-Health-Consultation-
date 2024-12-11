import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_healthcare_application/views/appoinment_view/appoinment_view.dart';
import 'package:e_healthcare_application/views/home_view/home.dart';
import 'package:e_healthcare_application/views/login_view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:e_healthcare_application/consts/consts.dart';

class AuthController extends GetxController {
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

//Doctor's editing controllers
  var addressController = TextEditingController();
  var aboutController = TextEditingController();
  var servicesController = TextEditingController();
  var timingController = TextEditingController();
  var phoneController = TextEditingController();
  var categoryController = TextEditingController();

  UserCredential? userCredential;

  isUserAlreadyLoggedIn() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        var data = await FirebaseFirestore.instance
            .collection('doctors')
            .doc(user.uid)
            .get();
        var isDoc = data.data()?.containsKey('docName') ?? false;

        if (isDoc) {
          Get.offAll(() => AppoinmentView());
        } else {
          Get.offAll(() => Home());
        }
        Get.offAll(() => Home());
      } else {
        Get.offAll(() => LoginView());
      }
    });
  }

  loginUser() async {
    userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  signupUser(bool isDoctor) async {
    userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    await storeUserData(userCredential!.user!.uid, fullnameController.text,
        emailController.text, isDoctor);
  }

  storeUserData(
      String uid, String fullname, String email, bool isDoctor) async {
    var store = FirebaseFirestore.instance
        .collection(isDoctor ? 'doctors' : 'users')
        .doc(uid);
    if (isDoctor) {
      await store.set({
        'docAbout': aboutController.text,
        'docAdress': addressController.text,
        'docCategory': categoryController.text,
        'docPhone': phoneController.text,
        'docService': servicesController.text,
        'docTiming': timingController.text,
        'docId': FirebaseAuth.instance.currentUser?.uid,
        'docRating': 1,
        'docEmail': email
      });
    } else {
      await store.set({'fullname': fullname, 'email': email});
    }
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
