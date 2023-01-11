import 'package:flutter/material.dart';
import 'package:flutter_favorite/core/extension/int_extension.dart';

class MealImage extends StatelessWidget {

  final String _imgStr;
  MealImage(this._imgStr);

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      fit: BoxFit.cover,
      height: 200.px,
      width: double.infinity,
      placeholder: "assets/image/maple.jpeg",
      image: _imgStr,
    );
  }
}
