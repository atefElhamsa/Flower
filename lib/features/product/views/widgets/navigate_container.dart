// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/app_colors.dart';

class NavigateContainer extends StatelessWidget {
  NavigateContainer({super.key, required this.title, required this.click});

  final String title;
  void Function()? click;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.03),
        decoration: BoxDecoration(
          color: AppColors.brown,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.sizeOf(context).width * 0.03,
            ),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.white,
                fontSize: MediaQuery.sizeOf(context).height * 0.023,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
