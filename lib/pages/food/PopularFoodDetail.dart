import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/controllers/popular_product_controller.dart';
import 'package:delivery_app/pages/cart/CartPage.dart';
import 'package:delivery_app/pages/home/dimensions.dart';
import 'package:delivery_app/pages/home/mainFoodPage.dart';
import 'package:delivery_app/routes/route_helper.dart';
import 'package:delivery_app/utils/AppConstants.dart';
import 'package:delivery_app/utils/Colors.dart';
import 'package:delivery_app/widgets/AppIcon.dart';
import 'package:delivery_app/widgets/BigText.dart';
import 'package:delivery_app/widgets/ExpandableTextWidget.dart';
import 'package:delivery_app/widgets/IconAndTextWidget.dart';
import 'package:delivery_app/widgets/SmallText.dart';
import 'package:delivery_app/widgets/TitleColumn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  final String pageName;
  PopularFoodDetail({Key? key, required this.pageId, required this.pageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
        body: Stack(children: [
          //background img
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          AppConstants.BASE_URL + "/uploads/" + product.img!))),
            ),
          ),
          //icons

          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
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
                    child: AppIcon(icon: Icons.arrow_back_ios)),
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
                            Get.find<PopularProductController>().totalItems >= 1
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
                            Get.find<PopularProductController>().totalItems >= 1
                                ? Positioned(
                                    right: 4,
                                    top: 2,
                                    child: BigText(
                                      text: Get.find<PopularProductController>()
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
          ),
          // intro of food sec
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 30,
            child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width15,
                    right: Dimensions.width15,
                    top: Dimensions.width15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleColumn(
                        text: product.name!,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText(
                        text: "Introduce",
                        size: Dimensions.font20,
                        color: Colors.black,
                      ),
                      SizedBox(height: Dimensions.height10),
                      Expanded(
                          child: SingleChildScrollView(
                              child: ExpandableTextWidget(
                                  text: product.description!)))
                    ])),
          )

          //expandable text widget
        ]),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (popularProducts) {
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
                    GestureDetector(
                        onTap: () {
                          popularProducts.setQuantity(false);
                        },
                        child: Icon(Icons.remove)),
                    SizedBox(width: Dimensions.width10 / 2),
                    BigText(text: popularProducts.inCartItems.toString()),
                    SizedBox(width: Dimensions.width10 / 2),
                    GestureDetector(
                        onTap: () {
                          popularProducts.setQuantity(true);
                        },
                        child: Icon(Icons.add))
                  ]),
                ),
                GestureDetector(
                    onTap: () {
                      popularProducts.addItem(product);
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
            ),
          );
        }));
  }
}
