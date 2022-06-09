import 'package:flutter/material.dart';

import 'colors.dart';

const TextStyle defaultTextStyle = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.bold,
);

const bodyStyle = TextStyle(fontSize: 19.0);

class CustomTextStyle {
  static const dayTabBarStyleInactive = TextStyle(
    color: CustomColors.kLightColor,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const dayTabBarStyleActive = TextStyle(
    color: CustomColors.kPrimaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const metricTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25);
}
