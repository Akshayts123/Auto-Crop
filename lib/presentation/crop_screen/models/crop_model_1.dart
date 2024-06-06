import 'dart:typed_data';

class CropdetailsItemModel1 {
  final int id;
  final String name;
  final String detail;
  final Uint8List image;
  final String month;
  final String soil;
  final String weather;

  CropdetailsItemModel1( {
    required this.id,
    required this.name,
    required this.detail,
    required this.month,
    required this.soil,
    required this.weather,
    required this.image,
  });
}