import 'package:e_healthcare_application/consts/consts.dart';
import 'package:e_healthcare_application/views/login_view/login_view.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
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



