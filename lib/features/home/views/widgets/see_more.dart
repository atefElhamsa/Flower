import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.03,bottom: MediaQuery.sizeOf(context).height * 0.025,),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.brown,
                fontSize: MediaQuery.sizeOf(context).height * 0.02,
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Image.asset(AppImages.seeAll),
          ),
        ],
      ),
    );
  }
}
