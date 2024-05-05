import 'package:flower_app/features/search_juice/views/widgets/search_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_texts.dart';
import 'data/models/juicemodel.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchKey = GlobalKey<FormState>();
  List<JuiceModel> searchList = [];

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
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    child: Form(
                      key: searchKey,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            searchList = juices
                                .where((element) => element.title
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(
                            FocusNode(),
                          );
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter The Name Of Juice";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        cursorColor: AppColors.black,
                        decoration: InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.sizeOf(context).width * 0.02),
                            borderSide: BorderSide(
                              color: AppColors.brown,
                              width: MediaQuery.sizeOf(context).width * 0.001,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.sizeOf(context).width * 0.02),
                            borderSide: BorderSide(
                              color: AppColors.red,
                              width: MediaQuery.sizeOf(context).width * 0.003,
                            ),
                          ),
                          filled: true,
                          fillColor: AppColors.transparent,
                          label: Text(
                            AppTexts.searchInMilkShake,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColors.brown.withOpacity(0.3),
                                fontSize:
                                    MediaQuery.sizeOf(context).height * 0.02,
                              ),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.sizeOf(context).width * 0.02),
                            borderSide: BorderSide(
                              color: AppColors.brown,
                              width: MediaQuery.sizeOf(context).width * 0.001,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.sizeOf(context).width * 0.02),
                            borderSide: BorderSide(
                              color: AppColors.brown,
                              width: MediaQuery.sizeOf(context).width * 0.003,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.05,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding:
                        EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.02),
                    decoration: BoxDecoration(
                      color: AppColors.rose,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(
                            MediaQuery.sizeOf(context).width * 0.04),
                        topLeft: Radius.circular(
                            MediaQuery.sizeOf(context).width * 0.04),
                        topRight: Radius.circular(
                            MediaQuery.sizeOf(context).width * 0.04),
                      ),
                    ),
                    child: const Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SearchBodyWidget(searchList: searchList),
    );
  }
}
