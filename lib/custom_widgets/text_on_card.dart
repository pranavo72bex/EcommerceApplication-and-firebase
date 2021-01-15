import 'package:flutter/material.dart';
import 'package:youtube_tutorial_ecommerce/contents.dart';

class TextOnCard extends StatelessWidget {
  final dynamic text;
  final double left;
  final double bottom;
  TextOnCard({this.text, this.left, this.bottom});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: bottom,
        left: left,
        child: Text("$text", style: Constants.positionOnCardText));
  }
}
