import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/divider.dart';
import '../../../product/views/product_detail_screen.dart';
import '../data/models/juicemodel.dart';

// ignore: must_be_immutable
class SearchBodyWidget extends StatelessWidget {
  SearchBodyWidget({super.key, required this.searchList});

  List<JuiceModel> searchList;
  @override
  Widget build(BuildContext context) {
    return Column(
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
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.04),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return ProductDetailsScreen(
                            title: searchList.isEmpty
                                ? juices[index].title
                                : searchList[index].title,
                            description: searchList.isEmpty
                                ? juices[index].description
                                : searchList[index].description,
                            image: searchList.isEmpty
                                ? juices[index].image
                                : searchList[index].image,
                            price: searchList.isEmpty
                                ? juices[index].price
                                : searchList[index].price,
                            count: searchList.isEmpty
                                ? juices[index].count
                                : searchList[index].count,
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
                                height:
                                MediaQuery.sizeOf(context).height * 0.01,
                              ),
                              Text(
                                searchList.isEmpty
                                    ? juices[index].title
                                    : searchList[index].title,
                                style: GoogleFonts.pangolin(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.brown,
                                    fontSize:
                                    MediaQuery.sizeOf(context).height *
                                        0.025,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                MediaQuery.sizeOf(context).height * 0.01,
                              ),
                              Text(
                                searchList.isEmpty
                                    ? juices[index].description
                                    : searchList[index].description,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.brown.withOpacity(0.65),
                                    fontSize:
                                    MediaQuery.sizeOf(context).height *
                                        0.02,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                MediaQuery.sizeOf(context).height * 0.03,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${searchList.isEmpty ? juices[index].price.toString() : searchList[index].price.toString()} LE",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.brown,
                                        fontSize: MediaQuery.sizeOf(context)
                                            .height *
                                            0.025,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {

                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.brown,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(
                                            MediaQuery.sizeOf(context).width *
                                                0.03,
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
                          child: Image.asset(
                            searchList.isEmpty
                                ? juices[index].image
                                : searchList[index].image,
                          ),
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
            itemCount: searchList.isEmpty ? juices.length : searchList.length,
            physics: const BouncingScrollPhysics(),
          ),
        ),
      ],
    );
  }
}
