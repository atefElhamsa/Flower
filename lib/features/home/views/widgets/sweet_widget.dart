import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SweetWidget extends StatefulWidget {
  const SweetWidget({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  final String name;
  final String image;
  final String description;
  final double price;

  @override
  State<SweetWidget> createState() => _SweetWidgetState();
}

class _SweetWidgetState extends State<SweetWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.4,
            decoration: BoxDecoration(
              color: AppColors.rose.withOpacity(0.25),
              borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.sizeOf(context).width * 0.03),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.023,
                ),
                SizedBox(
                  child: Image.asset(
                    widget.image,
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: MediaQuery.sizeOf(context).height * 0.089,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.006,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                          MediaQuery.sizeOf(context).width * 0.03),
                      bottomRight: Radius.circular(
                          MediaQuery.sizeOf(context).width * 0.03),
                    ),
                  ),
                  height: MediaQuery.sizeOf(context).height * 0.089,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.sizeOf(context).width * 0.03),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.0025,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.name,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.brown,
                                fontSize:
                                    MediaQuery.sizeOf(context).height * 0.016,
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
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.sizeOf(context).height * 0.015,
                              color: AppColors.greyDesc,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.price.toString(),
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.brown,
                                  fontSize:
                                      MediaQuery.sizeOf(context).height * 0.023,
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
                                            0.03),
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
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
