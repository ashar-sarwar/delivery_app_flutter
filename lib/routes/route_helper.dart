import 'package:delivery_app/pages/cart/CartPage.dart';
import 'package:delivery_app/pages/food/PopularFoodDetail.dart';
import 'package:delivery_app/pages/food/RecommendedFoodDetail.dart';
import 'package:delivery_app/pages/home/HomePage.dart';
import 'package:delivery_app/pages/home/mainFoodPage.dart';
import 'package:delivery_app/pages/splash/SplashPage.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";

  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getSplashPage() => '$splashPage';

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String pageName) =>
      '$popularFood?pageId=$pageId&pageName=${pageName}';
  static String getRecommendedFood(int pageId, String pageName) =>
      '$recommendedFood?pageId=$pageId&pageName=${pageName}';

  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(
      name: splashPage,
      page: () {
        return SplashPage();
      },
    ),
    GetPage(
        name: initial,
        page: () {
          return HomePage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var pageName = Get.parameters['pageName'];

          return PopularFoodDetail(
              pageId: int.parse(pageId!), pageName: pageName!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var pageName = Get.parameters['pageName'];

          return RecommendedFoodDetail(
              pageId: int.parse(pageId!), pageName: pageName!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn)
  ];
}
