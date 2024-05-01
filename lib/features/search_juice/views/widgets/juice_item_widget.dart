// ignore_for_file: must_be_immutable

import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class JuiceItemWidget extends StatelessWidget {
  JuiceItemWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
  });

  final String title;
  final String description;
  final String image;
  double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.04),
      child: Container(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.04),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.roseWhite.withOpacity(1),
              AppColors.roseWhite.withOpacity(0),
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.sizeOf(context).width * 0.02,
            ),
          ),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Image.asset(image),
            Text(title),
          ],
        ),
      ),
    );
  }
}
