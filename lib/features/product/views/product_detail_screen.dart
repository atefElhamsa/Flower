// ignore_for_file: must_be_immutable

import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/features/product/views/widgets/product_body.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_images.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.count,
  });

  final String title;
  final String description;
  final String image;
  double price;
  int count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.rose,
      appBar: AppBar(
        backgroundColor: AppColors.rose,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.02,
            vertical: MediaQuery.sizeOf(context).height * 0.02,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_outlined),
            ),
          ),
        ),
        title: Image.asset(
          image,
          height: MediaQuery.sizeOf(context).height * 0.25,
          fit: BoxFit.cover,
        ),
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.3,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.06,
              vertical: MediaQuery.sizeOf(context).height * 0.03,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(AppImages.vector),
            ),
          ),
        ],
      ),
      body: ProductBodyWidget(
        title: title,
        price: price,
        image: image,
        description: description,
        count: count,
      ),
    );
  }
}
