import 'package:e_healthcare_application/consts/consts.dart';
import 'package:e_healthcare_application/consts/lists.dart';
import 'package:e_healthcare_application/consts/strings.dart';
import 'package:e_healthcare_application/res/components/custom_textfield.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyles.bold(
            title: "${AppStrings.welcome} User",
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(14),
              color: AppColors.blueColor,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(

                      hint: AppStrings.search,
                      borderColor: AppColors.whiteColor,
                      textColor: AppColors.whiteColor,
                       validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a search term';
    }
    return null;
  },
                    ),
                  ),
                  10.widthBox,
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search, color: AppColors.whiteColor))
                ],
              )),
          20.heightBox,
          Padding(
            padding: const EdgeInsets.all(10.0),
   child:Center(
    child: SingleChildScrollView( child: Column(
              children: [

                SizedBox(
                    height: 80,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){},
                             child:Container(
                            decoration: BoxDecoration(
                               color: AppColors.blueColor,
                               borderRadius: BorderRadius.circular(12),
                            ),
                              padding: EdgeInsets.all(12),
                              margin: EdgeInsets.only(right: 8),                       

                              child: Column(
                                children: [
                                  Image.asset(
                                  iconsList[index],
                                      width: 30, 
                                      color: AppColors.whiteColor),
                                  5.heightBox,
                                  AppStyles.normal(title:iconsTitleList[index], color:AppColors.whiteColor),
                                ],
                              )),
                          );
                           
                        })),

                        10.heightBox,
                     Align(
                      alignment: Alignment.center,
                     child:AppStyles.bold(
                      title: "Popular Doctors",
                     color: AppColors.blueColor,
                     size:AppSizes.size18 ),),

                        
                        SizedBox(
                          height: 150,
                           child:ListView.builder(
                             physics: BouncingScrollPhysics(),
                            scrollDirection:Axis.horizontal,
                            itemCount:3, 
                           itemBuilder:(BuildContext context,int index){

                          return Container(

                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: AppColors.blueColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: const EdgeInsets.only(right: 8),
              
                            height: 100,
                            width: 150,
                            
                            child:Column(
                              children:[
          
                              Container(
                                width:150,
                                alignment: Alignment.center,
                                color:AppColors.blueColor,
                                child:Image.asset(
                                AppAssets.imgSignup,
                                width: 100,
                                fit:BoxFit.cover,
                              ),
                     
                              ),

                              
                   5.heightBox,
                AppStyles.normal(title: "Doctor name"),
           5.heightBox,
                AppStyles.normal(title: "category",color:Colors.black),

                              ], 
                            ),

                          );
                        }
                         )
                     ),
                     5.heightBox,

                     GestureDetector(
                      onTap: (){

                      },
                      child:   Align(
                    alignment: Alignment.centerRight,
                    child: AppStyles.normal(title: "View All",color: AppColors.blueColor), 
                   ),
                     ),
                 
                 20.heightBox,
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children:List.generate(4,
                  (index)=> Container(
                  decoration: BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius: BorderRadius.circular(12)
                  ),

                  padding: const EdgeInsets.all(12),
                  
                  child: Column(
                    children: [
                      Image.asset(AppAssets.icBody,width: 25,color: AppColors.whiteColor,),
                      5.heightBox,
                      AppStyles.normal(title: "Lab Test",color: AppColors.whiteColor),
                    ],
                  ),
                 )),
                 )

              ],
            ),),
   )

            


          )
        ],
      ),
    );
  }
}





