import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/core/utils/app_texts.dart';

class DrinkModel {
  String image;
  String name;
  DrinkModel({required this.image, required this.name});
}

List<DrinkModel> drinks = [
  DrinkModel(
    image: AppImages.milkShakeOnly,
    name: AppTexts.milkshake,
  ),
  DrinkModel(
    image: AppImages.orange,
    name: AppTexts.floreVitamin,
  ),
  DrinkModel(
    image: AppImages.spanshlate,
    name: AppTexts.spanishLatte,
  ),
  DrinkModel(
    image: AppImages.choclate,
    name: AppTexts.chocolateDrinks,
  ),
];
