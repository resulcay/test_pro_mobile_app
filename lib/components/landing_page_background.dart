import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app/constants/colors.dart';

class LandingPageBackground extends StatelessWidget {
  const LandingPageBackground({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.30,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            gradient1,
            gradient2,
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
    );
  }
}
