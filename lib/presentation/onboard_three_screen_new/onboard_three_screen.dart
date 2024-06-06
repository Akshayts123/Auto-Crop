
import 'package:auto_crop/core/app_export.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../core/utils/image_constant.dart';
import '../../widgets/custom_icon_button.dart';
import 'controller/onboard_three_controller.dart';
import 'models/on_boarding_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class OnboardThreeScreen1 extends GetWidget<OnboardThreeController> {
  OnboardThreeScreen1({Key? key})
      : super(
          key: key,
        );

  PageController pageController = PageController();

  List<OnBoardingPageViewModel> onboardingPageViewModelList = [
    OnBoardingPageViewModel(
      onlineDoctorBro: ImageConstant.imgReforestationBro,
      effortlessAppointmentBookings: "your adventure begins",
      effortlessAppointmentBookingsblue: "here!",
      description: "It is a long established fact that a reader will be distracted by the readable content of a page ".tr,
    ),
    OnBoardingPageViewModel(
      onlineDoctorBro: ImageConstant.imgPlantingTreeCuate,
      effortlessAppointmentBookings: "Lets make every",
      effortlessAppointmentBookingsblue: "moment count",
      description: "It is a long established fact that a reader will be distracted by the readable content of a page ".tr,
    ),
    OnBoardingPageViewModel(
      onlineDoctorBro: ImageConstant.imgPlantingTreeAmico,
      effortlessAppointmentBookings: "Elevate your experience",
      effortlessAppointmentBookingsblue: "effortlessly",
      description: "It is a long established fact that a reader will be distracted by the readable content of a page ".tr,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 24.v),
          child: Column(
            children: [
              SizedBox(
                height: 650.v,
                child: PageView(
                  onPageChanged: (index) {
                    // if (index == onboardingPageViewModelList.length - 1) {
                    //   // Last page reached, navigate to homepage
                    //   // You can replace '/homepage' with the actual route to your homepage
                    //   Get.toNamed(AppRoutes.signInScreen);
                    // }
                  },
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(onboardingPageViewModelList.length,
                      (index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 19.h),
                      child: Column(
                        children: [
                          // Spacer(),
                          Image.asset(
                             onboardingPageViewModelList[index]
                                .onlineDoctorBro!,
                            height: 336.adaptSize,
                            width: 336.adaptSize,
                          ),
                          Container(
                            width: 252.h,
                            margin: EdgeInsets.only(
                              left: 42.h,
                              top: 66.v,
                              right: 43.h,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: onboardingPageViewModelList[index]
                                        .effortlessAppointmentBookings,
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                  TextSpan(
                                    text: " ",
                                  ),
                                  TextSpan(
                                    text: onboardingPageViewModelList[index]
                                        .effortlessAppointmentBookingsblue,
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: 294.h,
                            margin: EdgeInsets.only(
                              left: 20.h,
                              top: 9.v,
                              right: 22.h,
                            ),
                            child: Text(
                              onboardingPageViewModelList[index].description!,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.bodySmall12,
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 19.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        axisDirection: Axis.horizontal,
                        effect: ScrollingDotsEffect(
                          spacing: 10,
                          activeDotColor: theme.colorScheme.primary,
                          dotColor: theme.colorScheme.primary.withOpacity(0.2),
                          dotHeight: 10.v,
                          dotWidth: 10.h,
                        ),
                        onDotClicked: (value) {
                          pageController.jumpToPage(value);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 66.h),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CustomIconButton(decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                            onTap: () {
                              if (pageController.page == onboardingPageViewModelList.length - 1) {
                                // Last page reached, navigate to the desired screen
                                Get.toNamed(AppRoutes.signInScreen);
                              } else {
                                // Move to the next page
                                pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              }
                            },
                            height: 60.adaptSize,
                            width: 60.adaptSize,
                            padding: EdgeInsets.all(22.h),
                            // decoration: IconButtonStyleHelper.fillPrimary,
                            child: CustomImageView(
                              color: Colors.white.withOpacity(1),
                              height: 50.adaptSize,
                              width: 50.adaptSize,
                              imagePath: ImageConstant.imgArrowRight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
