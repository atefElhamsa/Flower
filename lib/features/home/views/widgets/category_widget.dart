// ignore_for_file: must_be_immutable

import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key, required this.name, required this.image});

  String image;
  String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.02),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.rose.withOpacity(0.6),
                AppColors.rose.withOpacity(0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            color: AppColors.rose,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            image,
            height: MediaQuery.sizeOf(context).height * 0.09,
          ),
        ),
        Text(
          name,
          style: GoogleFonts.syne(
            textStyle: TextStyle(
              fontSize: MediaQuery.sizeOf(context).height * 0.019,
              fontWeight: FontWeight.w400,
              color: AppColors.brown,
            ),
          ),
        ),
      ],
    );
  }
}
