import 'package:flower_app/core/widgets/divider.dart';
import 'package:flower_app/features/search_juice/views/data/models/juicemodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_texts.dart';
import '../../done/views/order_success.dart';
import '../../product/views/widgets/navigate_container.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    List<JuiceModel> cart =
        juices.where((element) => element.addCart == true).toList();

    double totalPrice = 0;
    int countSelectedItem = 0;

    double total() {
      setState(() {
        for (int i = 0; i < cart.length; i++) {
          totalPrice += cart[i].count * cart[i].price;
        }
      });
      return totalPrice;
    }

    int selectedItem() {
      setState(() {
        for (int i = 0; i < cart.length; i++) {
          countSelectedItem += cart[i].count;
        }
      });
      return countSelectedItem;
    }

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
            setState(() {
              Navigator.pop(context);
            });
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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: DividerWidget(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.01,
            ),
          ),
          SliverList.separated(
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.03,
                    ),
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
                        padding: EdgeInsets.all(
                          MediaQuery.sizeOf(context).height * 0.015,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                cart[index].title,
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
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.01,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                cart[index].description,
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
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${AppTexts.price} : ${cart[index].price} LE",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.pink,
                                    fontSize:
                                        MediaQuery.sizeOf(context).height *
                                            0.02,
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
                                      fontSize:
                                          MediaQuery.sizeOf(context).height *
                                              0.02,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${cart[index].count * cart[index].price} LE",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.brown,
                                      fontSize:
                                          MediaQuery.sizeOf(context).height *
                                              0.02,
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
                      onTap: () {
                        setState(() {
                          cart[index].addCart = false;
                          cart[index].count = 0;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * 0.05,
                          vertical: MediaQuery.sizeOf(context).width * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.rose,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                                MediaQuery.sizeOf(context).width * 0.05),
                            bottomLeft: Radius.circular(
                                MediaQuery.sizeOf(context).width * 0.06),
                          ),
                        ),
                        child: const Icon(Icons.close_rounded),
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.sizeOf(context).width * 0.6,
                    child: Image.asset(cart[index].image),
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
                                if (cart[index].count > 0) {
                                  countSelectedItem = 0;
                                  totalPrice = 0;
                                  cart[index].count -= 1;
                                }
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
                            cart[index].count.toString(),
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize:
                                    MediaQuery.sizeOf(context).height * 0.025,
                                fontWeight: FontWeight.w500,
                                color: AppColors.brown,
                              ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                countSelectedItem = 0;
                                totalPrice = 0;
                                cart[index].count += 1;
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
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              );
            },
            itemCount: cart.length,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.03),
              child: Container(
                padding:
                    EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.03),
                decoration: BoxDecoration(
                  color: AppColors.roseWhiteTotal,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      MediaQuery.sizeOf(context).width * 0.03,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      "${AppTexts.selectedItems} (${selectedItem().toString()})",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.brown,
                          fontSize: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${AppTexts.total} : ${total().toString()} LE",
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
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.03,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.03),
              child: NavigateContainer(
                title: AppTexts.confirm,
                click: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const OrderSuccess();
                    }),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
