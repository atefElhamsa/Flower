import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/core/utils/app_texts.dart';

class OnBoardingModel {
  final String backgroundImage;
  final String image;
  final String title;
  final String description;
  final String textButton;
  OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
    required this.textButton,
    required this.backgroundImage,
  });
}

List<OnBoardingModel> onBoardingView = [
  OnBoardingModel(
    image: AppImages.donuts,
    title: "Donuts",
    description: "Made by hand, from scratch \n with love",
    textButton: AppTexts.next,
    backgroundImage: AppImages.onBoard1,
  ),
  OnBoardingModel(
    image: AppImages.cake,
    title: "Piece of cake",
    description: "Made by hand, from scratch \n with love",
    textButton: AppTexts.next,
    backgroundImage: AppImages.onBoard2,
  ),
  OnBoardingModel(
    image: AppImages.milkShake,
    title: "Milkshake",
    description: "Made by hand, from scratch \n with love",
    textButton: AppTexts.getStart,
    backgroundImage: AppImages.onBoard3,
  ),
];
