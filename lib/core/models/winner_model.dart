import 'dart:ui';

class WinnerModel {
  final String name;
  final String imageUrl;
  final String time;
  final int rank;
  final int percent;
  final double height;
  final double weight;
  final int colorCode;

  WinnerModel({
    required this.name,
    required this.imageUrl,
    required this.time,
    required this.rank,
    required this.percent,
    required this.height,
    required this.weight,
    required this.colorCode,
  });

  Color get color => Color(colorCode!);
}