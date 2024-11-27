import 'package:e_healthcare_application/consts/lists.dart';

import '../../consts/consts.dart';
class CategoryView extends StatelessWidget {
const CategoryView({super.key});


@override
build(BuildContext context) {
return Scaffold(
appBar: AppBar(
elevation: 0.0,

title: AppStyles.bold (title: AppStrings.category, size: AppSizes.size18,color: AppColors.whiteColor),
),// Appar

body: Padding(
  padding: const EdgeInsets.all(10.0),
  child: GridView.builder(
    physics: BouncingScrollPhysics(),
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
  (crossAxisCount: 2,
  mainAxisSpacing: 8,
  crossAxisSpacing: 8,
  mainAxisExtent: 170),
  
   itemCount:iconsList.length,
   itemBuilder: (BuildContext context,int index){

    return GestureDetector(
      onTap: (){

      },
        child: Container(
            padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.blueColor,
         
        
        ),
        
         child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                alignment: Alignment.center,
                child: Image.asset(
                iconsList[index],width: 60,
              color: Colors.white,
              ),
              ),
      
        30.heightBox,
        
        AppStyles.bold(
          title: iconsTitleList[index],
          color: AppColors.whiteColor,
          size: AppSizes.size16),
        
        10.heightBox,
         AppStyles.normal(
          
          title: "Eye specialist",
          color: AppColors.whiteColor.withOpacity(0.5),
          size: AppSizes.size16),
        
        
            ],
            
          )
            ),
      );
   }
  
  
  ),
), // Scaffold

);
}
}