import 'package:e_healthcare_application/consts/consts.dart';
import 'package:e_healthcare_application/res/components/custom_textfield.dart';

class HomeView extends StatelessWidget{
  const HomeView({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar:AppBar(
        elevation: 0.0,
        title:AppStyles.bold(title: "${AppStrings.welcome} User",color:AppColors.whiteColor,size:AppSizes.size18),

         
         ),
       body: Column(
        children:[
         Container(
          padding: EdgeInsets.all(10),
          height: 120,
          color: AppColors.blueColor,
          child:CustomTextField(hint: AppStrings.search),
         )
        ]
       ,

       ),
       
       );
  }
}