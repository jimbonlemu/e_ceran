import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  final String text;
  final double textSize;
  final TextStyle? customStyle;

  const WidgetText({
    Key? key,
    this.text = '',
    this.textSize = 15,
    this.customStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: customStyle ??
             TextStyle(
              fontFamily: 'Arimo_bold',
              color: Colors.black,
              letterSpacing: 1.5,
              fontSize: textSize,
            ));
  }
}
