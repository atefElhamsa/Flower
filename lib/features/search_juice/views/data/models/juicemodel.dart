import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/core/utils/app_texts.dart';

class JuiceModel {
  final String title;
  final String description;
  double price;
  final String image;
  JuiceModel({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });
}

List<JuiceModel> juices = [
  JuiceModel(
    image: AppImages.milkShakeOnly,
    title: AppTexts.oreoMilkshake,
    description: AppTexts.descriptionOreo,
    price: 45,
  ),
  JuiceModel(
    image: AppImages.vanillaMilkShake,
    title: AppTexts.vanillaMilkshake,
    description: AppTexts.descriptionVanilla,
    price: 45,
  ),
  JuiceModel(
    image: AppImages.chocolateMilkShake,
    title: AppTexts.chocolateMilkshake,
    description: AppTexts.descriptionChocolate,
    price: 45,
  ),
  JuiceModel(
    image: AppImages.mangoMilkShake,
    title: AppTexts.mangoMilkshake,
    description: AppTexts.descriptionMango,
    price: 45,
  ),
];
