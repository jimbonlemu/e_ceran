import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  final String text;
  final double textSize;
  final Color? color;
  final String? styleType;
  final TextAlign? textAlign;

  const WidgetText({
    Key? key,
    this.text = '',
    this.textSize = 15,
    this.styleType,
    this.color = Colors.black,
    this.textAlign
  }) : super(key: key);

  static const List<Map<String, TextStyle>> _textStyles = [
    {
      'regular': TextStyle(
        fontFamily: 'Arimo_regular',
        color: Colors.black,
        letterSpacing: 1,
      ),
    },
    {
      'semibold': TextStyle(
        fontFamily: 'Arimo_semibold',
        color: Colors.black,
        letterSpacing: 1,
      ),
    },
    {
      'medium': TextStyle(
        fontFamily: 'Arimo_medium',
        color: Colors.black,
        letterSpacing: 1,
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final TextStyle? customStyle = _textStyles.firstWhere(
        (style) => style.containsKey(styleType),
        orElse: () => {})[styleType];
    return Text(text,
        style: customStyle?.copyWith(fontSize: textSize) ??
            TextStyle(
              fontFamily: 'Arimo_bold',
              color: color,
              letterSpacing: 1.5,
              fontSize: textSize,
              
            ),
            textAlign: textAlign,);
  }
}
