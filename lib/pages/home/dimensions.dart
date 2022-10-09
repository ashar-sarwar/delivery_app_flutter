import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  //height of screen / height of foodPageBody container  ---> 844/320

  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.75;

  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.75;

  static double font10 = screenHeight / 84.4;
  static double font15 = screenHeight / 56.27;
  static double font20 = screenHeight / 42.2;
  static double font30 = screenHeight / 28.13;
  static double font45 = screenHeight / 18.75;

  static double radius10 = screenHeight / 84.4;
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;
  static double radius45 = screenHeight / 18.75;

  static double icon24 = screenHeight / 35.17;
  static double icon16 = screenHeight / 52.75;

  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContainer = screenWidth / 3.9;

  static double popularFoodImgSize = screenHeight / 2.41;

  static double bottomHeightBar = screenHeight / 7.03;
}
