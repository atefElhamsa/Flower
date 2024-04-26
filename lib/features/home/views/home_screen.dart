import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/core/utils/app_texts.dart';
import 'package:flower_app/features/home/data/models/drinkmodel.dart';
import 'package:flower_app/features/home/data/models/eatmodel.dart';
import 'package:flower_app/features/home/views/widgets/bannar_widget.dart';
import 'package:flower_app/features/home/views/widgets/category_widget.dart';
import 'package:flower_app/features/home/views/widgets/search_home_widget.dart';
import 'package:flower_app/features/home/views/widgets/see_more.dart';
import 'package:flower_app/features/home/views/widgets/sweet_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          AppImages.logo,
          width: MediaQuery.sizeOf(context).width * 0.22,
          height: MediaQuery.sizeOf(context).height * 0.1,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.04),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: BannarWidget(),
            ),
            const SliverToBoxAdapter(
              child: SearchHomeWidget(),
            ),
            const SliverToBoxAdapter(
              child: SeeMore(title: AppTexts.discoverByCategory),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.15,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                      name: drinks[index].name,
                      image: drinks[index].image,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.04,
                    );
                  },
                  itemCount: drinks.length,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SeeMore(title: AppTexts.bestSelling),
            ),
            SliverGrid.builder(
              itemCount: snakes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
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
      ),
    );
  }
}
