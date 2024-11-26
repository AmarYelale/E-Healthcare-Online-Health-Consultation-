import 'package:e_healthcare_application/consts/consts.dart';

class HomeView extends StatelessWidget{
  const HomeView({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:AppStyles.bold(title: "${AppStrings.welcome} User",color:AppColors.whiteColor,size:AppSizes.size18),

         
         ),
       body: Container(

       ),
       
       );
  }
}