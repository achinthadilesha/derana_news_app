// flutter package imports here
import 'package:flutter/material.dart';

/// this custom widget is responisible for returning
/// progress indicator with custom color
class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.redAccent[400],
      ),
    );
  }
}
