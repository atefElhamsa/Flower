// ignore_for_file: must_be_immutable

import 'package:flower_app/features/cart/views/cart_screen.dart';
import 'package:flower_app/features/product/views/widgets/navigate_container.dart';
import 'package:flower_app/features/product/views/widgets/total.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_texts.dart';
import '../../../../core/widgets/divider.dart';

class ProductBodyWidget extends StatefulWidget {
  ProductBodyWidget({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.count,
  });

  final String title;
  final String image;
  final String description;
  double price;
  int count;

  @override
  State<ProductBodyWidget> createState() => _ProductBodyWidgetState();
}

class _ProductBodyWidgetState extends State<ProductBodyWidget> {
  int count = 0;
  void addCount() {
    count += 1;
  }

  void minusCount() {
    if (count > 0) {
      count -= 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MediaQuery.sizeOf(context).width * 0.12),
          topRight: Radius.circular(MediaQuery.sizeOf(context).width * 0.12),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.07),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.pangolin(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.brown,
                      fontSize: MediaQuery.sizeOf(context).height * 0.03,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  "${widget.price.toString()} LE",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.brown,
                      fontSize: MediaQuery.sizeOf(context).height * 0.03,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.015,
            ),
            Text(
              "There are many variations of passages of Lorem \n Ipsum available, he majority have There are many \n variations of passages of Lorem Ipsum available, \n he majority have",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.brown.withOpacity(0.65),
                  fontSize: MediaQuery.sizeOf(context).height * 0.0195,
                ),
              ),
            ),
            const DividerWidget(),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.21),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      MediaQuery.sizeOf(context).width * 0.1,
                    ),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.white.withOpacity(1),
                      AppColors.rosePlus.withOpacity(1),
                      AppColors.rose.withOpacity(1),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          minusCount();
                        });
                      },
                      child: Icon(
                        Icons.do_disturb_on_rounded,
                        size: MediaQuery.sizeOf(context).height * 0.04,
                        color: AppColors.brown,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      count.toString(),
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height * 0.025,
                          fontWeight: FontWeight.w500,
                          color: AppColors.brown,
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          addCount();
                        });
                      },
                      child: Icon(
                        Icons.add_circle_outlined,
                        size: MediaQuery.sizeOf(context).height * 0.04,
                        color: AppColors.brown,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            TotalContainer(
              count: count,
              price: widget.price,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.03,
            ),
            NavigateContainer(
              title: AppTexts.addToCart,
              click: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CartScreen(
                    title: widget.title,
                    description: widget.description,
                    image: widget.image,
                    price: widget.price,
                    count: widget.count,
                  );
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
