import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/core/utils/app_texts.dart';

class JuiceModel {
  final String title;
  final String description;
  final String image;
  final double price;
  bool addCart;
  int count;
  JuiceModel({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    this.count = 0,
    this.addCart = false,
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
