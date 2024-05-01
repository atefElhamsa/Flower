import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/features/home/data/models/eatmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SweetWidget extends StatefulWidget {
  const SweetWidget({super.key,required this.itemCount});

  final int itemCount;

  @override
  State<SweetWidget> createState() => _SweetWidgetState();
}

class _SweetWidgetState extends State<SweetWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: widget.itemCount,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 30,
      ),
      itemBuilder: (context, index) {
        return Center(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.4,
                height: MediaQuery.sizeOf(context).height * 0.207,
                decoration: BoxDecoration(
                  color: AppColors.rose.withOpacity(0.25),
                  borderRadius: BorderRadius.all(
                    Radius.circular(MediaQuery.sizeOf(context).width * 0.03),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.011,
                    ),
                    SizedBox(
                      child: Image.asset(
                        snakes[index].image,
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        height: MediaQuery.sizeOf(context).height * 0.089,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            MediaQuery.sizeOf(context).width * 0.03,
                          ),
                          bottomRight: Radius.circular(
                            MediaQuery.sizeOf(context).width * 0.03,
                          ),
                        ),
                      ),
                      height: MediaQuery.sizeOf(context).height * 0.107,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.sizeOf(context).width * 0.03,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.01,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                snakes[index].name,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.brown,
                                    fontSize:
                                        MediaQuery.sizeOf(context).height *
                                            0.016,
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
                                snakes[index].description,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.sizeOf(context).height * 0.015,
                                  color: AppColors.greyDesc,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.02,
                            ),
                            Row(
                              children: [
                                Text(
                                  snakes[index].price.toString(),
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.brown,
                                      fontSize:
                                          MediaQuery.sizeOf(context).height *
                                              0.023,
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
                    ),
                  ],
                ),
              ),
              Positioned(
                right: MediaQuery.sizeOf(context).width * 0.007,
                top: MediaQuery.sizeOf(context).height * 0.003,
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        snakes[index].fav = !snakes[index].fav;
                      });
                    },
                    icon: snakes[index].fav == true
                        ? const Icon(
                            Icons.favorite_outlined,
                            color: AppColors.black,
                          )
                        : const Icon(
                            Icons.favorite_border_outlined,
                            color: AppColors.black,
                          ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
