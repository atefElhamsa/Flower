import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/core/utils/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class BannarWidget extends StatelessWidget {
  const BannarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.bannar),
        Positioned(
          top: MediaQuery.sizeOf(context).height * 0.02,
          child: Text(
            AppTexts.bannarText,
            style: GoogleFonts.pangolin(
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.brown,
                fontSize: MediaQuery.sizeOf(context).height * 0.02,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
