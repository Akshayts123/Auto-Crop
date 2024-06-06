// import '../controller/admin_controller.dart';
// import '../models/userprofile_item_model.dart';
// import 'package:auto_crop/core/app_export.dart';
// import 'package:auto_crop/widgets/custom_icon_button.dart';
// import 'package:flutter/material.dart';
//
// // ignore: must_be_immutable
// class UserprofileItemWidget extends StatelessWidget {
//   UserprofileItemWidget(
//     this.userprofileItemModelObj, {
//     Key? key,
//   }) : super(
//           key: key,
//         );
//
//   UserprofileItemModel userprofileItemModelObj;
//
//   var controller = Get.find<AdminController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: 11.h,
//         vertical: 10.v,
//       ),
//       decoration: AppDecoration.outlineSecondaryContainer1.copyWith(
//         borderRadius: BorderRadiusStyle.roundedBorder10,
//       ),
//       child: Row(
//         children: [
//           CustomImageView(
//             imagePath: ImageConstant.imgRectangle55,
//             height: 68.v,
//             width: 83.h,
//             radius: BorderRadius.circular(
//               5.h,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               left: 16.h,
//               top: 4.v,
//               bottom: 4.v,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Obx(
//                   () => Text(
//                     userprofileItemModelObj.almondsText!.value,
//                     style: theme.textTheme.titleSmall,
//                   ),
//                 ),
//                 SizedBox(height: 3.v),
//                 SizedBox(
//                   width: 118.h,
//                   child: Obx(
//                     () => Text(
//                       userprofileItemModelObj.loremIpsumText!.value,
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                       style: theme.textTheme.bodySmall,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               left: 28.h,
//               top: 14.v,
//               bottom: 9.v,
//             ),
//             child: CustomIconButton(
//               height: 45.adaptSize,
//               width: 45.adaptSize,
//               padding: EdgeInsets.all(9.h),
//               child: CustomImageView(
//                 imagePath: ImageConstant.imgEdit,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
