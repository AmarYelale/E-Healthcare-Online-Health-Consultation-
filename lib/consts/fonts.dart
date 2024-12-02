// ignore: unused_

//import 'package:e_healthcare_application/views/login_view/login_view.dart';
import 'package:e_healthcare_application/consts/consts.dart';

class AppFonts {
  static String sansRegular = "sans_regular", sansBold = "sans_bold";
}

class AppSizes {
  static const size12 = 12.0,
      size14 = 14.0,
      size16 = 16.0,
      size18 = 18.0,
      size20 = 20.0,
      size22 = 22.0,
      size34 = 34.0;
}

class AppStyles {
  static normal(
      {required String title,
      Color? color = Colors.black,
      double? size = 14,
      TextAlign alignment = TextAlign.left}) {
    return title.text.size(size).color(color).make();
  }

  static bold(
      {required String title,
      Color? color = Colors.black,
      double? size = 14,
      TextAlign alignment = TextAlign.left}) {
    return title.text
        .size(size)
        .color(color)
        .fontFamily(AppFonts.sansBold)
        .align(alignment)
        .make();
  }
}
