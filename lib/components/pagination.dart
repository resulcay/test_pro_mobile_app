import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app/screens/register_screen.dart';
import 'package:test_pro_mobile_app/widgets/toggle_button.dart';

import '../screens/landing_screen.dart';
import '../screens/login_screen.dart';

class Pagination extends StatefulWidget {
  const Pagination({Key? key}) : super(key: key);

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = [
      const RegisterScreen(),
      const LoginScreen()
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LandingScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          ToggleButton(
            pageConrollerToToggle: pageController,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: widgetList,
            ),
          ),
        ],
      ),
    );
  }
}
