import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/controllers/popular_product_controller.dart';
import 'package:delivery_app/controllers/recommended_product_controller.dart';
import 'package:delivery_app/pages/home/dimensions.dart';
import 'package:delivery_app/routes/route_helper.dart';
import 'package:delivery_app/utils/AppConstants.dart';
import 'package:delivery_app/utils/Colors.dart';
import 'package:delivery_app/widgets/AppIcon.dart';
import 'package:delivery_app/widgets/BigText.dart';
import 'package:delivery_app/widgets/SmallText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: Dimensions.height20 * 3,
                left: Dimensions.width10,
                right: Dimensions.width10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          // Get.back();

                          Get.toNamed(RouteHelper.getCartPage());
                        },
                        child: AppIcon(
                            icon: Icons.arrow_back_ios,
                            iconColor: Colors.white,
                            backgroundColor: AppColors.mainColor,
                            iconSize: Dimensions.icon16)),
                    Row(children: [
                      GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getInitial());
                          },
                          child: AppIcon(
                              icon: Icons.home,
                              iconColor: Colors.white,
                              backgroundColor: AppColors.mainColor,
                              iconSize: Dimensions.icon16)),
                      SizedBox(
                        width: Dimensions.width20,
                      ),
                      AppIcon(
                          icon: Icons.arrow_back_ios,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                          iconSize: Dimensions.icon16)
                    ])
                  ],
                )),
            Positioned(
                top: Dimensions.height20 * 6,
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: 0,
                child: Container(
                    child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GetBuilder<CartController>(
                            builder: (cartController) {
                          var _cartList = cartController.getItems;
                          return ListView.builder(
                              itemCount: cartController.getItems.length,
                              itemBuilder: (_, index) {
                                return GestureDetector(
                                    onTap: () {
                                      var popularIndex =
                                          Get.find<PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                      if (popularIndex >= 0) {
                                        Get.toNamed(RouteHelper.getPopularFood(
                                            popularIndex, 'cart'));
                                      } else {
                                        var recommendedIndex = Get.find<
                                                RecommendedProductController>()
                                            .recommendedProductList
                                            .indexOf(_cartList[index].product!);
                                        if (recommendedIndex >= 0) {
                                          Get.toNamed(
                                              RouteHelper.getRecommendedFood(
                                                  recommendedIndex, 'cart'));
                                        }
                                      }
                                    },
                                    child: Container(
                                        width: double.maxFinite,
                                        height: Dimensions.width20 * 5,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: Dimensions.width20 * 5,
                                              width: Dimensions.width20 * 5,
                                              margin: EdgeInsets.only(
                                                  bottom: Dimensions.height10),
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image:
                                                          //  AssetImage(
                                                          //     "assets/images/foodImage1.jpeg")
                                                          NetworkImage(
                                                              AppConstants
                                                                      .BASE_URL +
                                                                  "/uploads/" +
                                                                  cartController
                                                                      .getItems[
                                                                          index]
                                                                      .img!)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius10),
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              width: Dimensions.width10,
                                            ),
                                            Expanded(
                                                child: Container(
                                              height: Dimensions.width20 * 5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  BigText(
                                                    text: cartController
                                                        .getItems[index].name!,
                                                    color: Colors.black,
                                                    size: Dimensions.font20,
                                                  ),
                                                  SmallText(text: 'abc 123'),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      BigText(
                                                        text: cartController
                                                            .getItems[index]
                                                            .price
                                                            .toString(),
                                                        color: Colors.red,
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.only(
                                                            top: Dimensions
                                                                .height10,
                                                            bottom: Dimensions
                                                                .height10,
                                                            left: Dimensions
                                                                .width20,
                                                            right: Dimensions
                                                                .width20),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    Dimensions
                                                                        .radius20),
                                                            color:
                                                                Colors.white),
                                                        child: Row(children: [
                                                          GestureDetector(
                                                              onTap: () {
                                                                cartController.addItem(
                                                                    _cartList[
                                                                            index]
                                                                        .product!,
                                                                    -1);
                                                              },
                                                              child: Icon(Icons
                                                                  .remove)),
                                                          SizedBox(
                                                              width: Dimensions
                                                                      .width10 /
                                                                  2),
                                                          BigText(
                                                              text: cartController
                                                                  .getItems[
                                                                      index]
                                                                  .quantity
                                                                  .toString()),
                                                          SizedBox(
                                                              width: Dimensions
                                                                      .width10 /
                                                                  2),
                                                          GestureDetector(
                                                              onTap: () {
                                                                cartController.addItem(
                                                                    _cartList[
                                                                            index]
                                                                        .product!,
                                                                    1);
                                                              },
                                                              child: Icon(
                                                                  Icons.add))
                                                        ]),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ))
                                          ],
                                        )));
                              });
                        }))))
          ],
        ),
        bottomNavigationBar:
            GetBuilder<CartController>(builder: (cartController) {
          return Container(
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
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Row(children: [
                    SizedBox(width: Dimensions.width10 / 2),
                    BigText(
                        text: "\$ " + cartController.totalAmount.toString()),
                    SizedBox(width: Dimensions.width10 / 2),
                  ]),
                ),
                GestureDetector(
                    onTap: () {
                      // popularProducts.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      child: BigText(
                          // text: "\$ ${product.price!} | Add to cart",
                          text: 'Checkout',
                          color: Colors.white),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor),
                    ))
              ],
            ),
          );
        }));
  }
}
