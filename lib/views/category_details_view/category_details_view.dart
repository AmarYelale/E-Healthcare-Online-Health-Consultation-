import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_healthcare_application/consts/consts.dart';
import 'package:e_healthcare_application/views/doctor_profile_view/doctor_profile_view.dart';
import 'package:get/get.dart';

class CategoryDetailsView extends StatelessWidget {
  final String catName;
  const CategoryDetailsView({super.key, required this.catName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: AppStyles.bold(
            title: catName, color: AppColors.whiteColor, size: AppSizes.size18),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance
              .collection('doctors')
              .where('docCategory', isEqualTo: catName)
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var data = snapshot.data?.docs;

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 200,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: AppColors.bgDarkColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.only(right: 8),
                      height: 100,
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            // width: 150,
                            alignment: Alignment.center,
                            color: AppColors.blueColor,
                            child: Image.asset(
                              AppAssets.imgSignup,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          5.heightBox,
                          AppStyles.normal(
                              title: data![index]['docName'],
                              color: Colors.black),
                          VxRating(
                            selectionColor: AppColors.yellowColor,
                            onRatingUpdate: (value) {},
                            maxRating: 5,
                            count: 5,
                            value: double.parse(
                                data[index]['docrating'].toString()),
                            stepInt: true,
                          )
                        ],
                      ),
                    ).onTap(() {
                      Get.to(() => DoctorProfileView(doc: data[index]));
                    });
                  }, //
                ),
              );
            }
          }),
    );
  }
}
