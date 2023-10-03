import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  final String text;
  final TextStyle? customStyle;

  const WidgetText({
    Key? key,
    this.text = '',
    this.customStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: customStyle ??
            const TextStyle(
              fontFamily: 'Arimo_bold',
              color: Colors.black,
              letterSpacing: 1.5,
              fontSize: 15,
            ));
  }
}
