import '../../add_crop_screen/controller/add_crop_controller.dart';
import '../../crop_screen/controller/crop_controller.dart';
import '../../crop_screen/models/crop_model_1.dart';
import 'package:auto_crop/core/app_export.dart';
import 'package:auto_crop/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class allScreenCrop extends StatelessWidget {
  final CropdetailsItemModel1 model;
  allScreenCrop({
    Key? key, required this.model,
  }) : super(
    key: key,
  );

  // UserprofileItemModel userprofileItemModelObj;

  var controller = Get.find<CropController>();
  var addcontroller = Get.put(AddCropController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.outlineSecondaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [
              Image.memory(model.image,height: 83.v,
                  width: 83.h, fit: BoxFit.cover),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 4.v,
                  bottom: 4.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: theme.textTheme.titleSmall,
                    ),

                    SizedBox(height: 3.v),
                    Text(
                      "Month : ${model.month}",
                      style: theme.textTheme.bodySmall,
                    ),
                    SizedBox(height: 3.v),
                    Text(
                      "Soil : ${model.soil}",
                      style: theme.textTheme.bodySmall,
                    ),SizedBox(height: 3.v),
                    Text(
                      "Weather : ${model.weather}",
                      style: theme.textTheme.bodySmall,
                    ),SizedBox(height: 3.v),

                    Text(
                      "Description : ${model.detail}",
                      style: theme.textTheme.bodySmall,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
