// ignore_for_file: must_be_immutable

import 'package:flower_app/core/utils/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/app_colors.dart';

class SearchForItemWidget extends StatelessWidget {
  SearchForItemWidget({super.key});

  var searchKey = GlobalKey<FormState>();
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.05,
              child: Form(
                key: searchKey,
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(
                      FocusNode(),
                    );
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter The Name Of Juice";
                    }
                    return null;
                  },
                  controller: searchController,
                  keyboardType: TextInputType.name,
                  cursorColor: AppColors.black,
                  decoration: InputDecoration(
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.sizeOf(context).width * 0.02),
                      borderSide: BorderSide(
                        color: AppColors.brown,
                        width: MediaQuery.sizeOf(context).width * 0.001,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.sizeOf(context).width * 0.02),
                      borderSide: BorderSide(
                        color: AppColors.red,
                        width: MediaQuery.sizeOf(context).width * 0.003,
                      ),
                    ),
                    filled: true,
                    fillColor: AppColors.transparent,
                    label: Text(
                      AppTexts.searchInMilkShake,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.brown.withOpacity(0.3),
                          fontSize: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.sizeOf(context).width * 0.02),
                      borderSide: BorderSide(
                        color: AppColors.brown,
                        width: MediaQuery.sizeOf(context).width * 0.001,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.sizeOf(context).width * 0.02),
                      borderSide: BorderSide(
                        color: AppColors.brown,
                        width: MediaQuery.sizeOf(context).width * 0.003,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.05,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.02),
              decoration: BoxDecoration(
                color: AppColors.rose,
                borderRadius: BorderRadius.only(
                  bottomRight:
                      Radius.circular(MediaQuery.sizeOf(context).width * 0.04),
                  topLeft:
                      Radius.circular(MediaQuery.sizeOf(context).width * 0.04),
                  topRight:
                      Radius.circular(MediaQuery.sizeOf(context).width * 0.04),
                ),
              ),
              child: const Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }
}
