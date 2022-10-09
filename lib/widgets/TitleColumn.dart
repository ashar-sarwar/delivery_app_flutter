import 'package:delivery_app/pages/home/dimensions.dart';
import 'package:delivery_app/utils/Colors.dart';
import 'package:delivery_app/widgets/BigText.dart';
import 'package:delivery_app/widgets/IconAndTextWidget.dart';
import 'package:delivery_app/widgets/SmallText.dart';
import 'package:flutter/material.dart';

class TitleColumn extends StatelessWidget {
  final String text;
  const TitleColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font20,
          color: Colors.black,
        ),
        SizedBox(
          height: Dimensions.height15,
        ),
        Row(
          children: [
            Wrap(
                children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                color: AppColors.mainColor,
                size: 15,
              );
            })),
            SizedBox(width: 10),
            SmallText(text: "4.5", size: Dimensions.font15),
            SizedBox(width: 10),
            SmallText(text: "1212", size: Dimensions.font15),
            SizedBox(width: 10),
            SmallText(text: "comments", size: Dimensions.font15),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: 'Normal',
                iconColor: AppColors.iconColor1),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: '1.2',
                iconColor: AppColors.iconColor1),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: '3.2',
                iconColor: AppColors.iconColor1),
          ],
        )
      ],
    );
  }
}
