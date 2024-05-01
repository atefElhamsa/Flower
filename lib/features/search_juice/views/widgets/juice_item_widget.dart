// ignore_for_file: must_be_immutable

import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.04),
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
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.pangolin(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.brown,
                        fontSize: MediaQuery.sizeOf(context).height * 0.025,
                      ),
                    ),
                  ),
                  Text(
                    description,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.brown.withOpacity(0.65),
                        fontSize: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                    ),
                  ),
                  Text(
                    price.toString(),
                    style: GoogleFonts.roboto(),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(image),
            ),
          ],
        ),
      ),
    );
  }
}
