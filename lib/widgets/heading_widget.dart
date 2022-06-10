import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'configs/size_config.dart';

class HeadingWidget extends StatelessWidget {
  final String text1;
  final String text2;
  const HeadingWidget({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: (size.width / 100) * 90,
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2),
      child: Row(
        children: [
          Text(
            text1,
            style: const TextStyle(
                color: CustomColors.kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            text2,
            style: const TextStyle(
                color: CustomColors.kLightColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
