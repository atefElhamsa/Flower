// ignore_for_file: must_be_immutable

import 'package:flower_app/core/widgets/divider.dart';
import 'package:flower_app/features/cart/views/widgets/only_cart_widget.dart';
import 'package:flower_app/features/done/views/order_success.dart';
import 'package:flower_app/features/product/views/widgets/navigate_container.dart';
import 'package:flower_app/features/product/views/widgets/total.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_texts.dart';

class CartScreen extends StatefulWidget {
  CartScreen({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.count,
  });

  final String title;
  final String description;
  final String image;
  double price;
  int count;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppTexts.cart,
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
      body: Column(
        children: [
          const DividerWidget(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          OnlyCartWidget(
            title: widget.title,
            description: widget.description,
            image: widget.image,
            price: widget.price,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.3,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.03),
            child: TotalContainer(
              count: widget.count,
              price: widget.price,
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.03),
            child: NavigateContainer(
              title: AppTexts.confirm,
              click: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context){
                    return const OrderSuccess();
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
