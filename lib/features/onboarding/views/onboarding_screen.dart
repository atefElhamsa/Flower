// ignore_for_file: must_be_immutable

import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/features/home/views/home_screen.dart';
import 'package:flower_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                onBoardingView[index].backgroundImage,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.sizeOf(context).width * 0.11,
                  right: MediaQuery.sizeOf(context).width * 0.11,
                  top: MediaQuery.sizeOf(context).height * 0.1,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.15,
                    ),
                    Image.asset(
                      onBoardingView[index].image,
                      height: MediaQuery.sizeOf(context).height * 0.15,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.04,
                    ),
                    Text(
                      onBoardingView[index].title,
                      style: GoogleFonts.rockSalt(
                        textStyle: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height * 0.05,
                          fontWeight: FontWeight.w400,
                          color: AppColors.brown,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    Text(
                      onBoardingView[index].description,
                      style: GoogleFonts.arapey(
                        textStyle: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height * 0.03,
                          fontWeight: FontWeight.w400,
                          color: AppColors.brown.withOpacity(0.65),
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.04,
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (index == onBoardingView.length - 1) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const HomeScreen();
                            }),
                          );
                        } else {
                          pageController.animateToPage(
                            index + 1,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      minWidth: double.infinity,
                      color: AppColors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                              MediaQuery.sizeOf(context).width * 0.02),
                          topLeft: Radius.circular(
                              MediaQuery.sizeOf(context).width * 0.5),
                          bottomRight: Radius.circular(
                              MediaQuery.sizeOf(context).width * 0.5),
                          bottomLeft: Radius.circular(
                              MediaQuery.sizeOf(context).width * 0.02),
                        ),
                      ),
                      textColor: AppColors.white,
                      child: Text(
                        onBoardingView[index].textButton,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: AppColors.white,
                            fontSize: MediaQuery.sizeOf(context).height * 0.02,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    SmoothPageIndicator(
                      controller: pageController,
                      count: onBoardingView.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: AppColors.brown,
                        dotHeight: MediaQuery.sizeOf(context).height * 0.01,
                        dotColor: AppColors.grey.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        itemCount: onBoardingView.length,
      ),
    );
  }
}
