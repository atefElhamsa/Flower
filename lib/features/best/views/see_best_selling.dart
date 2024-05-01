import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/core/utils/app_texts.dart';
import 'package:flower_app/core/widgets/divider.dart';
import 'package:flower_app/features/home/data/models/eatmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../home/views/widgets/sweet_widget.dart';

class SeeBestSelling extends StatefulWidget {
  const SeeBestSelling({super.key});

  @override
  State<SeeBestSelling> createState() => _SeeBestSellingState();
}

class _SeeBestSellingState extends State<SeeBestSelling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppTexts.bestSelling,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: MediaQuery.sizeOf(context).height * 0.03,
              fontWeight: FontWeight.w500,
              color: AppColors.brown,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        actions: [
          Padding(
            padding:
                EdgeInsets.only(right: MediaQuery.sizeOf(context).width * 0.04),
            child: Image.asset(AppImages.vector),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: DividerWidget(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.015,
            ),
          ),
          SliverToBoxAdapter(
            child: SweetWidget(
              itemCount: snakes.length,
            ),
          ),
        ],
      ),
    );
  }
}
