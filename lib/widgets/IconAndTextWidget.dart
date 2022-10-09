import 'package:delivery_app/pages/home/dimensions.dart';
import 'package:delivery_app/widgets/SmallText.dart';
import 'package:flutter/cupertino.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.icon24),
        SizedBox(width: 5),
        SmallText(text: text, size: Dimensions.font15)
      ],
    );
  }
}
