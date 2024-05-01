// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_texts.dart';

class TotalContainer extends StatelessWidget {
  TotalContainer({super.key, required this.count, required this.price});

  int count;
  double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.03),
      decoration: BoxDecoration(
        color: AppColors.roseWhiteTotal,
        borderRadius: BorderRadius.all(
          Radius.circular(
            MediaQuery.sizeOf(context).width * 0.03,
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            "${AppTexts.selectedItems} ($count)",
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.brown,
                fontSize: MediaQuery.sizeOf(context).height * 0.02,
              ),
            ),
          ),
          const Spacer(),
          Text(
            "${AppTexts.total} : ${count * price} LE",
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.brown,
                fontSize: MediaQuery.sizeOf(context).height * 0.02,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
