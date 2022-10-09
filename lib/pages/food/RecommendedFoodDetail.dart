import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/controllers/popular_product_controller.dart';
import 'package:delivery_app/controllers/recommended_product_controller.dart';
import 'package:delivery_app/pages/cart/CartPage.dart';
import 'package:delivery_app/pages/home/dimensions.dart';
import 'package:delivery_app/routes/route_helper.dart';
import 'package:delivery_app/utils/AppConstants.dart';
import 'package:delivery_app/utils/Colors.dart';
import 'package:delivery_app/widgets/AppIcon.dart';
import 'package:delivery_app/widgets/BigText.dart';
import 'package:delivery_app/widgets/ExpandableTextWidget.dart';
import 'package:delivery_app/widgets/SmallText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
  final String pageName;
  RecommendedFoodDetail(
      {Key? key, required this.pageId, required this.pageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 90,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (pageName == 'cart') {
                          Get.toNamed(RouteHelper.getCartPage());
                        } else {
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: AppIcon(icon: Icons.clear),
                    ),
                    GetBuilder<PopularProductController>(
                      builder: (controller) {
                        return GestureDetector(
                            onTap: () {
                              if (controller.totalItems >= 1) {
                                Get.toNamed(RouteHelper.getCartPage());
                              }
                            },
                            child: Stack(
                              children: [
                                AppIcon(icon: Icons.shopping_cart_outlined),
                                Get.find<PopularProductController>()
                                            .totalItems >=
                                        1
                                    ? Positioned(
                                        right: 0,
                                        top: 0,
                                        child: AppIcon(
                                          icon: Icons.circle,
                                          iconColor: Colors.transparent,
                                          size: 18,
                                          backgroundColor: AppColors.mainColor,
                                        ))
                                    : Container(),
                                Get.find<PopularProductController>()
                                            .totalItems >=
                                        1
                                    ? Positioned(
                                        right: 4,
                                        top: 2,
                                        child: BigText(
                                          text: Get.find<
                                                  PopularProductController>()
                                              .totalItems
                                              .toString(),
                                          size: 9,
                                          color: Colors.white,
                                        ))
                                    : Container()
                              ],
                            ));
                      },
                    )
                  ],
                ),
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(20),
                    child: Container(
                      // color: Colors.white,
                      child: Center(
                        child: BigText(
                          text: product.name!,
                          size: Dimensions.font20,
                          color: Colors.black,
                        ),
                      ),
                      width: double.maxFinite,
                      padding: EdgeInsets.only(
                          top: Dimensions.height10,
                          bottom: Dimensions.height10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius20),
                              topRight: Radius.circular(Dimensions.radius20))),
                    )),
                pinned: true,
                backgroundColor: Colors.yellow,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                  AppConstants.BASE_URL + "/uploads/" + product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ))),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(
                    text: product.description!,
                  ),
                  margin: EdgeInsets.only(
                      left: Dimensions.width15, right: Dimensions.width15),
                )
              ],
            ))
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20 * 2.5,
                      right: Dimensions.width20 * 2.5,
                      top: Dimensions.width20,
                      bottom: Dimensions.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            controller.setQuantity(false);
                          },
                          child: AppIcon(
                              iconColor: Colors.white,
                              backgroundColor: AppColors.mainColor,
                              icon: Icons.remove)),
                      BigText(
                          text:
                              "\$ ${product.price!} X ${controller.inCartItems}",
                          size: Dimensions.font20,
                          color: Colors.black),
                      GestureDetector(
                          onTap: () {
                            controller.setQuantity(true);
                          },
                          child: AppIcon(
                              iconColor: Colors.white,
                              backgroundColor: AppColors.mainColor,
                              icon: Icons.add))
                    ],
                  )),
              Container(
                  height: Dimensions.bottomHeightBar,
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      bottom: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.width20),
                  decoration: BoxDecoration(
                      color: AppColors.buttonBackgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20 * 2),
                          topRight: Radius.circular(Dimensions.radius20 * 2))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              top: Dimensions.height20,
                              bottom: Dimensions.height20,
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white),
                          child: Icon(
                            Icons.favorite,
                            color: AppColors.mainColor,
                          )),
                      GestureDetector(
                          onTap: () {
                            controller.addItem(product);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.height20,
                                bottom: Dimensions.height20,
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            child: BigText(
                                text: "\$ ${product.price!} | Add to cart",
                                color: Colors.white),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: AppColors.mainColor),
                          ))
                    ],
                  ))
            ],
          );
        }));
  }
}

// "orem Ipsum is simply dummy text of of m Ipsum is simply dummy text of of m Ipsum is simply dummy text of of m Ipsum is simply dummy text of of m Ipsum is simply dummy text of ofm Ipsum is simply dummy text of ofm Ipsum is simply dummy text of ofm Ipsum is simply dummy text of ofm Ipsum is simply dummy text of ofm Ipsum is simply dummy text of ofm Ipsum is simply dummy text of ofm Ipsum is simply dummy text of ofm Ipsum is simply dummy text of ofm Ipsum is simply dummy text of ofm Ipsum is simply dummy text of ofm Ipsum is simply dummy text of ofm Ipsum is simply dummy text of ofm Ipsum is simply dummy text of ofvvvm Ipsum is simply dummy text of of the printing and typesetting industry. Lorem Ipsum has been the my text of the printing and typesetting industry. Lorem Ipsum has been the my text of the printing and typesetting industry. Lorem Ipsum has been the my text of the printing and typesetting industry. Lorem Ipsum has been themy text of the printing and typesetting industry. Lorem Ipsum has been themy text of the printing and typesetting industry. Lorem Ipsum has been the my text of the printing and typesetting industry. Lorem Ipsum has been the my text of the printing and typesetting industry. Lorem Ipsum has been the my text of the printing and typesetting industry. Lorem Ipsum has been the my text of the printing and typesetting industry. Lorem Ipsum has been the  industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",

