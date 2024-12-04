import 'package:e_healthcare_application/consts/consts.dart';
import 'package:e_healthcare_application/firebase_options.dart';
import 'package:e_healthcare_application/views/login_view/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: AppFonts.sansRegular),
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}
