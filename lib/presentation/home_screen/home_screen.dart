import 'dart:ffi';

import 'package:auto_crop/presentation/add_crop_screen/controller/add_crop_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../data/database/database.dart';
import '../crop_screen/controller/crop_controller.dart';
import '../home_screen_two_screen/controller/home_screen_two_controller.dart';
import '../home_screen_two_screen/models/thirtyone_item_model.dart';
import '../home_screen_two_screen/widgets/thirtyone_item_widget.dart';
import '../sign_up_screen/controller/sign_up_controller.dart';
import '../sign_up_screen/models/users.dart';
import 'controller/home_controller.dart';
import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/widgets/custom_drop_down.dart';
import 'package:auto_crop/widgets/custom_elevated_button.dart';
import 'package:auto_crop/widgets/custom_icon_button.dart';
import 'package:auto_crop/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

import 'models/home_filter_crop.dart';

// ignore_for_file: must_be_immutable
class HomeScreen extends GetWidget<HomeController> {
  HomeScreen({Key? key,})
      : super(
          key: key,
        );
  final addcropcontroller = Get.put(AddCropController());
  final cropcontroller = Get.put(CropController());
  HomeScreenTwoController homecontroller = Get.put(HomeScreenTwoController());
  final SignUpController signUpController = Get.put(SignUpController());
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SmartRefresher(
          controller: controller.refreshController,
          enablePullDown: true,
          onRefresh: () async {
            await controller.fetchData();
            // Complete the refresh
            controller.refreshController.refreshCompleted();
          },
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  // Obx(() {
                  //   if (controller.isDataLoaded.value) {
                  //     // Data is still loading
                  //     return Center(child: CircularProgressIndicator());
                  //   } else if (addcropcontroller.cropList.isEmpty) {
                  //     // Data loaded, but no crops available
                  //     return Center(child: Text('No Crops available.'));
                  //   } else {
                  //     return Column(
                  //       children: addcropcontroller.cropList.map((crop) => ListTile(
                  //         title: Text(crop['name'] ?? ''),
                  //         subtitle: Text(crop['detail'] ?? ''),
                  //         // You can access other properties like 'month', 'soil', 'weather'
                  //         // and customize the ListTile accordingly.
                  //       )).toList(),
                  //     );
                  //   }
                  // }),

                  _buildComponentTwo(),
                  SizedBox(height: 43.v),
                  _buildThirtyOne(),
                  // SizedBox(
                  //   height: 258.v,
                  //   width: 170.h,
                  //   child: Stack(
                  //     alignment: Alignment.center,
                  //     children: [
                  //       // Align(
                  //       //   alignment: Alignment.bottomCenter,
                  //       //   child: Container(
                  //       //     height: 15.v,
                  //       //     width: 59.h,
                  //       //     decoration: BoxDecoration(
                  //       //       color: theme.colorScheme.secondaryContainer
                  //       //           .withOpacity(0.2),
                  //       //       borderRadius: BorderRadius.circular(
                  //       //         29.h,
                  //       //       ),
                  //       //     ),
                  //       //   ),
                  //       // ),
                  //       CustomImageView(
                  //         imagePath: ImageConstant.img2992992405Tre,
                  //         height: 254.v,
                  //         width: 170.h,
                  //         alignment: Alignment.center,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 25.v),
                  // SizedBox(
                  //   width: 213.h,
                  //   child: Text(
                  //     "msg_elevate_your_ex".tr,
                  //     maxLines: 2,
                  //     overflow: TextOverflow.ellipsis,
                  //     textAlign: TextAlign.center,
                  //     style: CustomTextStyles.titleLargePrimary,
                  //   ),
                  // ),
                  // SizedBox(height: 5.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  final DatabaseHelper dbHelper = DatabaseHelper();

  /// Section Widget
  Widget _buildComponentTwo() {
    User? signedUpUsers = controller.signedUpUser.value;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 29.v,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ImageConstant.imgComponent2,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<String?>(
            // Fetch the username asynchronously
            future: dbHelper.getUserName(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // If the Future is still running, show a loading indicator
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // If there's an error, display an error message
                return Center(child: Text("Error: ${snapshot.error}"));
              } else {
                // If the Future is complete, display the username
                String userName = snapshot.data ?? 'Guest';
                return Text(
                  'Welcome, $userName!',
                  style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),
                );
              }
            },
          ),
        // Text(
        // 'Welcome, $userName!', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
        //   Obx(() => Text('Welcome, ${controller.loggedUserName.value ?? 'Guest'}!',
        //       style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold))),
        //   Text('Welcome, ${signedUpUsers?.name ?? 'Guest'}!',style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold)),
          Column(
            children: [

              SizedBox(height: 27.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomSearchView(
                      controller: controller.searchController,
                      hintText: "lbl_search".tr,
                      onChanged: (value) {
                        controller.searchCrops(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.h),
                    child: CustomIconButton(
                      height: 43.v,
                      width: 49.h,
                      padding: EdgeInsets.all(13.h),
                      decoration: IconButtonStyleHelper.fillOnPrimaryContainerTL5,
                      child: CustomImageView(
                        color: Colors.black,
                        imagePath: ImageConstant.imgSearch,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.h),
                      child: CustomDropDown(
                        icon: Container(
                            margin: EdgeInsets.fromLTRB(0.h, 0.v, 0.h, 0.v),
                            child: Icon(Icons.arrow_drop_down)),
                        hintText: "Weather",
                        items: addcropcontroller
                            .addCropModelObj.value.dropdownItemList2!.value,
                        onChanged: (value) {
                          controller.onSelected(value);
                          controller.selectedWeather = value?.title ?? "";
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: CustomDropDown(
                        icon: Container(
                            margin: EdgeInsets.fromLTRB(0.h, 0.v, 0.h, 0.v),
                            child: Icon(Icons.arrow_drop_down)),
                        hintText: "lbl_soil".tr,
                        items: addcropcontroller
                            .addCropModelObj.value.dropdownItemList1!.value,
                        onChanged: (value) {
                          controller.onSelected1(value);
                          controller.selectedSoil = value?.title ?? "";
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 19.v),
              CustomDropDown(
                width: 157.h,
                icon: Container(
                    margin: EdgeInsets.fromLTRB(0.h, 0.v, 0.h, 0.v),
                    child: Icon(Icons.arrow_drop_down)),
                hintText: "lbl_month".tr,
                items:
                    addcropcontroller.addCropModelObj.value.dropdownItemList!.value,
                onChanged: (value) {
                  controller.onSelected2(value);
                  controller.selectedMonth = value?.title ?? "";
                },
              ),
              SizedBox(height: 28.v),
              CustomElevatedButton(
                onPressed: () => controller.fetchCrops(controller.selectedWeather,controller.selectedSoil,controller.selectedMonth),
                height: 36.v,
                width: 112.h,
                text: "lbl_submit2".tr,
                buttonStyle: CustomButtonStyles.fillOnPrimaryContainerTL5,
                buttonTextStyle: CustomTextStyles.titleSmallSemiBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildThirtyOne() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Center(
        child: Column(
          children: [

            Obx(() {
              if (controller.searchResults.isNotEmpty) {
                // Display search results
                return Column(
                  children: [
                    Text(
                      "lbl_your_seeds_here".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 15,),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 174.v,
                        crossAxisCount: 2,
                        mainAxisSpacing: 21.h,
                        crossAxisSpacing: 21.h,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.searchResults.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> crop = controller.searchResults[index];
                        return SearchResultItemWidget(crop);
                      },
                    ),
                  ],
                );
              } else if (addcropcontroller.cropList.isEmpty) {
                // No search results and no regular crops
                return Center(
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.img2992992405Tre,
                        height: 254.v,
                        width: 170.h,
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        width: 213.h,
                        child: Text(
                          "msg_elevate_your_ex".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.titleLargePrimary,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                // Display regular crops
                return Column(
                  children: [
                    Text(
                      "lbl_your_seeds_here".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 15,),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 174.v,
                        crossAxisCount: 2,
                        mainAxisSpacing: 21.h,
                        crossAxisSpacing: 21.h,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: addcropcontroller.cropList.length,
                      itemBuilder: (context, index) {
                        ThirtyoneItemModel model = homecontroller
                            .homeScreenTwoModelObj.value.thirtyoneItemList.value[index];
                        var filtercrop = addcropcontroller.cropList[index];

                        // Pass filtercrop to HomeCropModel constructor
                        HomeFilterCrop homeFilterCrop = HomeFilterCrop(
                          id: filtercrop['id'],
                          name: filtercrop['name'],
                          detail: filtercrop['detail'],
                          month: filtercrop['month'],
                          soil: filtercrop['soil'],
                          weather: filtercrop['weather'],
                          image: filtercrop['image'],
                        );

                        return GestureDetector(onTap: () {
                          Get.toNamed(AppRoutes.innerPageScreen,arguments: {
                          'image': filtercrop['image'],
                          'name': filtercrop['name'],
                          'detail':filtercrop['detail'],
                          'month': filtercrop['month'],
                          'soil': filtercrop['soil'],
                          'weather': filtercrop['weather'],
                          },);
                        },

                          child: ThirtyoneItemWidget(
                            model,
                            homeFilterCrop,
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
            }),
            SizedBox(height: 20.v),
            // Obx(() {
            //   if (controller.searchResults.isEmpty &&
            //       addcropcontroller.cropList.isEmpty) {
            //     // Show "All Clear" message when both regular crops and search results are empty
            //     return Text(
            //       "msg_all_clear".tr,
            //       style: CustomTextStyles.titleMediumPrimary,
            //     );
            //   } else {
            //     return Container(); // Empty container if not "All Clear"
            //   }
            // }),
          ],
        ),
      ),
    );
  }

}
class SearchResultItemWidget extends StatelessWidget {
  final Map<String, dynamic> crop;

  SearchResultItemWidget(this.crop);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      Get.toNamed(AppRoutes.innerPageScreen,arguments: {
        'image': crop['image'],
        'name': crop['name'],
        'detail':crop['detail'],
        'month': crop['month'],
        'soil': crop['soil'],
        'weather': crop['weather'],
      },);
    },
      child: ThirtyoneItemWidget(
        ThirtyoneItemModel(), // Provide an appropriate model or dummy model
        HomeFilterCrop(
          id: crop['id'],
          name: crop['name'],
          detail: crop['detail'],
          month: crop['month'],
          soil: crop['soil'],
          weather: crop['weather'],
          image: crop['image'],
        ),
      ),
    );
  }
}