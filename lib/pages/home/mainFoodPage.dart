import 'package:delivery_app/pages/home/FoodPageBody.dart';
import 'package:delivery_app/pages/home/dimensions.dart';
import 'package:delivery_app/utils/Colors.dart';
import 'package:delivery_app/widgets/BigText.dart';
import 'package:delivery_app/widgets/SmallText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print('Current height is' + MediaQuery.of(context).size.height.toString());
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: Dimensions.height45, bottom: Dimensions.width15),
          padding: EdgeInsets.only(
              left: Dimensions.width20, right: Dimensions.width20),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                BigText(text: 'Pakistan', color: AppColors.mainColor),
                Row(
                  children: [
                    SmallText(text: 'Karachi', color: Colors.black54),
                    Icon(Icons.arrow_drop_down_rounded)
                  ],
                )
              ]),
              Center(
                  child: Container(
                      width: Dimensions.width45,
                      height: Dimensions.height45,

                      //default size of icon in flutter is 24
                      child: Icon(Icons.search,
                          color: Colors.white, size: Dimensions.icon24),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ))),
            ],
          )),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: FoodPageBody(),
        )),
      ],
    ));
  }
}
