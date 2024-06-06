import 'dart:typed_data';

class HomeFilterCrop {
  final int id;
  final String name;
  final String detail;
  final Uint8List image;
  final String month;
  final String soil;
  final String weather;

  HomeFilterCrop( {
    required this.id,
    required this.name,
    required this.detail,
    required this.month,
    required this.soil,
    required this.weather,
    required this.image,
  });
}