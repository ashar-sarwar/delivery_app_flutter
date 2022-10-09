import 'package:delivery_app/pages/home/dimensions.dart';
import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;
  bool hasOverflow;

  SmallText(
      {Key? key,
      this.color = const Color(0xFFccc7c5),
      required this.text,
      this.hasOverflow = true,
      this.size = 0,
      this.height = 1.2,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasOverflow
        ? Text(
            text,
            maxLines: 2,
            overflow: overflow,
            style: TextStyle(
                fontFamily: 'Roboto',
                height: height,
                color: color,
                fontSize: size == 0 ? Dimensions.font10 : size),
          )
        : Text(
            text,
            style: TextStyle(
                fontFamily: 'Roboto',
                height: height,
                color: color,
                fontSize: size == 0 ? Dimensions.font10 : size),
          );
  }
}
