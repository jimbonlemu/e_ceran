import 'package:e_ceran/global_assets/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class WidgetMenu extends StatelessWidget {
  final BorderRadius radiusLevel;
  final Color backGroundColor;
  final double height;
  final double width;
  final String text;
  final double padding;
  final Image? menuIcon;
  final String? targetRoute;
  const WidgetMenu({
    Key? key,
    this.radiusLevel = const BorderRadius.all(Radius.circular(20)),
    this.backGroundColor = Colors.blue,
    this.height = 150,
    this.width = 150,
    this.padding = 20,
    this.menuIcon,
    this.text = '',
    this.targetRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (targetRoute == null) {
          print("targetRoute is Null, targetRoute wouldn't work !");
        } else {
          Navigator.of(context).pushNamed(targetRoute!);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: radiusLevel,
              child: Container(
                color: backGroundColor,
                height: height,
                width: width,
                child: menuIcon,
              ),
            ),
            SizedBox(
              height: padding,
            ),
            WidgetText(
              text: text,
              textSize: 17,
            ),
          ],
        ),
      ),
    );
  }
}
