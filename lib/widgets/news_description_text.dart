// flutter package imports here
import 'package:flutter/material.dart';

/// this custom widget is responisble for returning
/// padded text widget with custom args for config
/// used in news description screen
class NewsDescriptionText extends StatelessWidget {
  const NewsDescriptionText({
    Key? key,
    required this.paddingValue,
    required this.articleText,
    this.fontWeight = FontWeight.normal,
    required this.fontSize,
    this.textOverflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.justify,
  }) : super(key: key);

  final double paddingValue;
  final String articleText;
  final FontWeight fontWeight;
  final double fontSize;
  final TextOverflow textOverflow;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingValue),
      child: Text(
        articleText,
        overflow: textOverflow,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
        textAlign: textAlign,
      ),
    );
  }
}
