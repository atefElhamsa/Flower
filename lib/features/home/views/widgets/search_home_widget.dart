import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_texts.dart';
import 'package:flower_app/features/search_juice/views/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchHomeWidget extends StatelessWidget {
  const SearchHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const SearchScreen();
              }));
            },
            child: Container(
              padding: EdgeInsets.all(MediaQuery.sizeOf(context).height * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.sizeOf(context).width * 0.02),
                ),
                border: Border.all(
                  color: AppColors.brown,
                ),
              ),
              child: Text(
                AppTexts.searchHere,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.brown.withOpacity(0.3),
                    fontSize: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.05,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const SearchScreen();
            }));
          },
          child: Container(
            padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.02),
            decoration: BoxDecoration(
              color: AppColors.rose,
              borderRadius: BorderRadius.only(
                bottomRight:
                    Radius.circular(MediaQuery.sizeOf(context).width * 0.04),
                topLeft: Radius.circular(MediaQuery.sizeOf(context).width * 0.04),
                topRight:
                    Radius.circular(MediaQuery.sizeOf(context).width * 0.04),
              ),
            ),
            child: const Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}
