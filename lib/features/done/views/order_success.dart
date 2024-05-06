import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/core/utils/app_texts.dart';
import 'package:flower_app/features/home/views/home_screen.dart';
import 'package:flower_app/features/product/views/widgets/navigate_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AppImages.end,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Image.asset(
              AppImages.orderComplete,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.01,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                AppTexts.orderConfirmedSuccessfully,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.brown.withOpacity(0.9),
                    fontSize: MediaQuery.sizeOf(context).height * 0.023,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.05),
              child: NavigateContainer(
                title: AppTexts.backToHome,
                click: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
