import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/features/product/views/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/models/juicemodel.dart';

class JuiceItemWidget extends StatefulWidget {
  const JuiceItemWidget({super.key});

  @override
  State<JuiceItemWidget> createState() => _JuiceItemWidgetState();
}

class _JuiceItemWidgetState extends State<JuiceItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.04),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProductDetailsScreen(
                    title: juices[index].title,
                    description: juices[index].description,
                    image: juices[index].image,
                    price: juices[index].price,
                    count: juices[index].count,
                  );
                }));
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.04),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.roseWhite.withOpacity(1),
                      AppColors.roseWhite.withOpacity(0),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      MediaQuery.sizeOf(context).width * 0.02,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.01,
                          ),
                          Text(
                            juices[index].title,
                            style: GoogleFonts.pangolin(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.brown,
                                fontSize:
                                    MediaQuery.sizeOf(context).height * 0.025,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.01,
                          ),
                          Text(
                            juices[index].description,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.brown.withOpacity(0.65),
                                fontSize:
                                    MediaQuery.sizeOf(context).height * 0.02,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.03,
                          ),
                          Row(
                            children: [
                              Text(
                                "${juices[index].price.toString()} LE",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.brown,
                                    fontSize:
                                        MediaQuery.sizeOf(context).height *
                                            0.025,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.brown,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(
                                        MediaQuery.sizeOf(context).width * 0.03,
                                      ),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(juices[index].image),
                    ),
                  ],
                ),
              ),
            ),
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
    );
  }
}
