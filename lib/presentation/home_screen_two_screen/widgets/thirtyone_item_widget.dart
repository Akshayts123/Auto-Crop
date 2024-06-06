import '../../home_screen/models/home_filter_crop.dart';
import '../controller/home_screen_two_controller.dart';
import '../models/thirtyone_item_model.dart';
import 'package:auto_crop/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ThirtyoneItemWidget extends StatelessWidget {

  ThirtyoneItemWidget(
    this.thirtyoneItemModelObj,this.filter, {
    Key? key,
  }) : super(
          key: key,
        );
  HomeFilterCrop filter;
  ThirtyoneItemModel thirtyoneItemModelObj;

  var controller = Get.find<HomeScreenTwoController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineSecondaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Image.memory(
              filter.image,
              height: 89.v,
              width: 157.h,fit:BoxFit.cover,
          ),
          SizedBox(height: 2.v),
           Text(
              filter.name,
              style: theme.textTheme.titleSmall,

          ),
          SizedBox(height: 3.v),
          Text(
            "Month : ${filter.month}",
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 3.v),
          Text(
            "Soil : ${filter.soil}",
            style: theme.textTheme.bodySmall,
          ),SizedBox(height: 3.v),
          Text(
            "Weather : ${filter.weather}",
            style: theme.textTheme.bodySmall,
          ),

          SizedBox(height: 2.v),
        ],
      ),
    );
  }
}
