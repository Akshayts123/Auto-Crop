import 'dart:typed_data';
import 'package:auto_crop/presentation/all_seeds_screen/widgets/all_seed_widget.dart';

import '../admin_screen/models/userprofile_item_model.dart';
import '../crop_screen/widgets/userprofile_item_widget.dart';
import 'package:auto_crop/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../admin_screen/models/userprofile_item_model.dart';
import '../admin_screen/widgets/userprofile_item_widget.dart';
import '../crop_screen/controller/crop_controller.dart';
import '../crop_screen/models/crop_model_1.dart';
import '../crop_screen/widgets/userprofile_item_widget.dart';

class AllSeedsWidget extends GetWidget<CropController> {
  const AllSeedsWidget();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("All Seeds",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30.h,
                right: 20.h,
              ),
              child: Obx(
                    () {
                  if (controller.isDataLoaded.value) {
                    // Data is still loading
                    return Center(child: CircularProgressIndicator());
                  } else if (controller.cropList.isEmpty) {
                    // Data loaded, but no doctors available
                    return Center(child: Text('No Crops available.'));
                  } else {
                    return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (
                          context,
                          index,
                          ) {
                        return SizedBox(
                          height: 14.v,
                        );
                      },
                      itemCount: controller.cropList.length,
                      itemBuilder: (context, index) {
                        // UserprofileItemModel model = controller
                        //     .cropModelObj.value.userprofileItemList.value[index];
                        Map<String, dynamic> cropData = controller.cropList[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.innerPageScreen,arguments: {
                              'image': cropData['image'],
                              'name': cropData['name'],
                              'detail':cropData['detail'],
                              'month': cropData['month'],
                              'soil': cropData['soil'],
                              'weather': cropData['weather'],
                            },);
                          },
                          child: allScreenCrop(
                            model: CropdetailsItemModel1(
                              id: cropData["id"]??"",
                              name:cropData["name"]??"",
                              detail:cropData["detail"]??"",
                              month: cropData["month"]??"",
                              soil: cropData["soil"]??"",
                              weather: cropData["weather"]??"",
                              image: cropData["image"]?? Uint8List(0),),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );;
  }
}
