import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/core/utils/app_texts.dart';
import 'package:flower_app/core/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../home/data/models/eatmodel.dart';
import '../../home/views/widgets/sweet_widget.dart';

class SeeBestSelling extends StatelessWidget {
  const SeeBestSelling({super.key});

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
            child: DividerWidget()
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.015,
            ),
          ),
          SliverGrid.builder(
            itemCount: snakes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
            ),
            itemBuilder: (context, index) {
              return SweetWidget(
                name: snakes[index].name,
                description: snakes[index].description,
                price: snakes[index].price,
                image: snakes[index].image,
              );
            },
          ),
        ],
      ),
    );
  }
}
