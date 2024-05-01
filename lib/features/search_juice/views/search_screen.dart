import 'package:flower_app/core/widgets/divider.dart';
import 'package:flower_app/features/search_juice/views/data/models/juicemodel.dart';
import 'package:flower_app/features/search_juice/views/widgets/juice_item_widget.dart';
import 'package:flower_app/features/search_juice/views/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_texts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppTexts.milkshake,
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
        bottom: PreferredSize(
          preferredSize: Size(
            MediaQuery.sizeOf(context).width * 0.1,
            MediaQuery.sizeOf(context).height * 0.1,
          ),
          child: SearchForItemWidget(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          const DividerWidget(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.04,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return JuiceItemWidget(
                  title: juices[index].title,
                  description: juices[index].description,
                  image: juices[index].image,
                  price: juices[index].price,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                );
              },
              itemCount: juices.length,
              physics: const BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
