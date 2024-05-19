import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/core/utils/app_texts.dart';
import 'package:flower_app/features/best/views/see_best_selling.dart';
import 'package:flower_app/features/cart/views/cart_screen.dart';
import 'package:flower_app/features/home/data/models/drinkmodel.dart';
import 'package:flower_app/features/home/views/widgets/bannar_widget.dart';
import 'package:flower_app/features/home/views/widgets/category_widget.dart';
import 'package:flower_app/features/home/views/widgets/search_home_widget.dart';
import 'package:flower_app/features/home/views/widgets/see_more.dart';
import 'package:flower_app/features/home/views/widgets/sweet_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      drawer: Drawer(
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const CartScreen();
                }),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cart",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.sizeOf(context).height * 0.05,
                  ),
                ),
                Icon(
                  Icons.add_shopping_cart_rounded,
                  size: MediaQuery.sizeOf(context).height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.04),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: BannarWidget(),
            ),
            const SliverToBoxAdapter(
              child: SearchHomeWidget(),
            ),
            SliverToBoxAdapter(
              child: SeeMore(
                title: AppTexts.discoverByCategory,
                clickSeeAll: () {},
              ),
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
            SliverToBoxAdapter(
              child: SeeMore(
                title: AppTexts.bestSelling,
                clickSeeAll: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SeeBestSelling();
                  }));
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: SweetWidget(
                itemCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
