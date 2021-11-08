// flutter package imports here
import 'package:flutter/material.dart';

/// this custom widget responsible for returning
/// Centered image & this widget takes imagePath as an arg
class CustomPlaceholderImage extends StatelessWidget {
  final String imageName;

  const CustomPlaceholderImage({
    required this.imageName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        imageName,
        fit: BoxFit.contain,
      ),
    );
  }
}
