// ignore_for_file: must_be_immutable

import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnlyCartWidget extends StatefulWidget {
  OnlyCartWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
  });

  final String title;
  final String description;
  final String image;
  double price;

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
  State<OnlyCartWidget> createState() => _OnlyCartWidgetState();
}

class _OnlyCartWidgetState extends State<OnlyCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.03),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.roseWhite.withOpacity(1),
                  AppColors.roseWhite.withOpacity(0),
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  MediaQuery.sizeOf(context).width * 0.05,
                ),
              ),
            ),
            child: Padding(
              padding:
                  EdgeInsets.all(MediaQuery.sizeOf(context).height * 0.015),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.title,
                      style: GoogleFonts.pangolin(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.brown,
                          fontSize: MediaQuery.sizeOf(context).height * 0.025,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.description,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.brown.withOpacity(0.65),
                          fontSize: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${AppTexts.price} : ${widget.price} LE",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.pink,
                          fontSize: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${AppTexts.total} : ",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.pink,
                            fontSize: MediaQuery.sizeOf(context).height * 0.02,
                          ),
                        ),
                      ),
                      Text(
                        "${widget.count * widget.price} LE",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.brown,
                            fontSize: MediaQuery.sizeOf(context).height * 0.02,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.sizeOf(context).width * 0.81,
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.05,
                vertical: MediaQuery.sizeOf(context).width * 0.01,
              ),
              decoration: BoxDecoration(
                color: AppColors.rose,
                borderRadius: BorderRadius.only(
                  topRight:
                      Radius.circular(MediaQuery.sizeOf(context).width * 0.05),
                  bottomLeft:
                      Radius.circular(MediaQuery.sizeOf(context).width * 0.06),
                ),
              ),
              child: const Icon(Icons.close_rounded),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.sizeOf(context).width * 0.6,
          child: Image.asset(widget.image),
        ),
        Positioned(
          left: MediaQuery.sizeOf(context).width * 0.57,
          top: MediaQuery.sizeOf(context).height * 0.15,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.3,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.minusCount();
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
                  widget.count.toString(),
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
                      widget.addCount();
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
      ],
    );
  }
}
