import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:e_healthcare_application/consts/consts.dart';

class AuthController extends GetxController {
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  UserCredential? userCredential;
  signupUser() async {
    
    userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    if (UserCredential != null) {
      await storeUserData(userCredential!.user!.uid, fullnameController.text,
          emailController.text);
    }
  }

  storeUserData(String uid, String fullname, String email) async {
    var store = FirebaseFirestore.instance.collection('users').doc(uid);
    await store.set({'fullname': fullname, 'email': email});
  }
}
