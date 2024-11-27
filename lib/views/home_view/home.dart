import 'package:e_healthcare_application/consts/consts.dart';
import 'package:e_healthcare_application/views/category_view/category_view.dart';
import 'package:e_healthcare_application/views/home_view/home_view.dart';
import 'package:e_healthcare_application/views/login_view/login_view.dart';
import 'package:e_healthcare_application/views/settings_view/settings_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../consts/consts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

int selectedIndex = 0;
List screenList = [
const HomeView(),
Container(),
const CategoryView(),
const LoginView(),
const SettingsView(),

Container(
color: Colors.red),
Container(
color: Colors.green,
),
Container(
color: Colors.blue,
),

];


@override
Widget build(BuildContext context) {
return Scaffold(
body: screenList.elementAt(selectedIndex),
bottomNavigationBar: BottomNavigationBar(
unselectedItemColor: Colors.white.withOpacity(0.5  ),

selectedLabelStyle: TextStyle(color: AppColors.whiteColor),
selectedIconTheme: IconThemeData(color: AppColors.whiteColor),
  backgroundColor: AppColors.blueColor,
  type: BottomNavigationBarType .fixed,
currentIndex: selectedIndex,
onTap: (value) {
  setState((){
   selectedIndex=value;
  });
},
items: const [
BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
BottomNavigationBarItem(icon: Icon(Icons.book),label:"Appoinments"),
BottomNavigationBarItem(icon: Icon(Icons.category),label:"Category"),
BottomNavigationBarItem(icon: Icon(Icons.person),label:"Doctor"),
BottomNavigationBarItem(icon: Icon(Icons.settings),label:"Settings"),]
),
);
}
}

