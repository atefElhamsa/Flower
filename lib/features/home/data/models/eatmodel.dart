import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/core/utils/app_texts.dart';

class EatModel {
  final String image;
  bool fav;
  final String name;
  final String description;
  final double price;
  EatModel({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    this.fav = false,
  });
}

List<EatModel> snakes = [
  EatModel(
    image: AppImages.donut,
    name: AppTexts.dounts,
    description: AppTexts.descriptionDounts,
    price: 45,
  ),
  EatModel(
    image: AppImages.cake,
    name: AppTexts.pieceOfCake,
    description: AppTexts.descriptionCake,
    price: 45,
  ),
];
