import '../home_screen_two_screen/widgets/thirtyone_item_widget.dart';
import 'controller/home_screen_two_controller.dart';
import 'models/thirtyone_item_model.dart';
import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/widgets/custom_drop_down.dart';
import 'package:auto_crop/widgets/custom_elevated_button.dart';
import 'package:auto_crop/widgets/custom_icon_button.dart';
import 'package:auto_crop/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HomeScreenTwoScreen extends StatelessWidget {
   HomeScreenTwoScreen({Key? key})
      : super(
          key: key,
        );
  HomeScreenTwoController controller = Get.put(HomeScreenTwoController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildComponentTwo(),
                SizedBox(height: 27.v),
                Text(
                  "lbl_your_seeds_here".tr,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 28.v),
                _buildThirtyOne(),
                SizedBox(height: 65.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildComponentTwo() {
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
        children: [
          SizedBox(height: 37.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: controller.searchController,
                  hintText: "lbl_search".tr,
                  textInputAction: TextInputAction.done,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 17.h,
                    vertical: 13.v,
                  ),
                  borderDecoration: TextFormFieldStyleHelper.fillBlueGray,
                  filled: true,
                  fillColor: appTheme.blueGray100,
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
                      margin: EdgeInsets.fromLTRB(30.h, 6.v, 5.h, 5.v),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgArrowdown,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                    ),
                    hintText: "lbl_season".tr,
                    items: controller
                        .homeScreenTwoModelObj.value.dropdownItemList!.value,
                    onChanged: (value) {
                      controller.onSelected(value);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: CustomDropDown(
                    icon: Container(
                      margin: EdgeInsets.fromLTRB(30.h, 6.v, 5.h, 5.v),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgArrowdown,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                    ),
                    hintText: "lbl_soil".tr,
                    items: controller
                        .homeScreenTwoModelObj.value.dropdownItemList1!.value,
                    onChanged: (value) {
                      controller.onSelected1(value);
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
              margin: EdgeInsets.fromLTRB(30.h, 6.v, 5.h, 5.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowdown,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
            ),
            hintText: "lbl_month".tr,
            items:
                controller.homeScreenTwoModelObj.value.dropdownItemList2!.value,
            onChanged: (value) {
              controller.onSelected2(value);
            },
          ),
          SizedBox(height: 28.v),
          CustomElevatedButton(
            height: 36.v,
            width: 112.h,
            text: "lbl_submit2".tr,
            buttonStyle: CustomButtonStyles.fillOnPrimaryContainerTL5,
            buttonTextStyle: CustomTextStyles.titleSmallSemiBold,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildThirtyOne() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Obx(
        () => GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 154.v,
            crossAxisCount: 2,
            mainAxisSpacing: 21.h,
            crossAxisSpacing: 21.h,
          ),
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller
              .homeScreenTwoModelObj.value.thirtyoneItemList.value.length,
          itemBuilder: (context, index) {
            ThirtyoneItemModel model = controller
                .homeScreenTwoModelObj.value.thirtyoneItemList.value[index];
            // return ThirtyoneItemWidget(
            //   model,
            // );
          },
        ),
      ),
    );
  }
}
