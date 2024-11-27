import 'package:e_healthcare_application/consts/consts.dart';
import 'package:e_healthcare_application/consts/lists.dart';

class SettingsView extends StatelessWidget {
const SettingsView({ super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
  elevation: 0.0,
  title: AppStyles.bold(
    title: AppStrings.settings,
    color: AppColors.whiteColor,
    size: AppSizes.size18),
),

body:Column(
children: [
ListTile(
leading: CircleAvatar(
  child: Image.asset(AppAssets.imgSignup)),
title:AppStyles.bold(title: "Username"),
subtitle: AppStyles.normal(title: "Email"),
), // ListTile

const Divider(),
  20.heightBox,
  ListView(
children: List.generate(settingsList.length, (index)=> ListTile(
  t
)),
  )


],
), // Column
); // Scaffold
}
}