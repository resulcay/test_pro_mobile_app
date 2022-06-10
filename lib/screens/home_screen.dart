import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_pro_mobile_app/screens/user_screen.dart';

import '../constants/colors.dart';
import '../widgets/configs/size_config.dart';
import 'activity_screen.dart';
import 'dashboard_screen.dart';
import 'detailed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final tabs = [
    const DashboardScreen(),
    const ActivityScreen(),
    const DetailedScreen(),
    const UserScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: CustomColors.kPrimaryColor,
            size: 30,
          ),
          onPressed: () {},
        ),
        title: SvgPicture.asset(
          'assets/icons/dumbell.svg',
          height: (size.width / 100) * 10,
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.notifications,
              size: 30,
              color: CustomColors.kPrimaryColor,
            ),
          )
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "",
            activeIcon: SvgPicture.asset(
              'assets/icons/apps.svg',
              height: 30,
              color: CustomColors.kPrimaryColor,
            ),
            icon: SvgPicture.asset(
              'assets/icons/apps.svg',
              height: 30,
              color: Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              'assets/icons/clock.svg',
              height: 30,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/clock.svg',
              height: 30,
              color: CustomColors.kPrimaryColor,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              'assets/icons/stats.svg',
              height: 30,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/stats.svg',
              height: 30,
              color: CustomColors.kPrimaryColor,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              height: 30,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/user.svg',
              height: 30,
              color: CustomColors.kPrimaryColor,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: CustomColors.kPrimaryColor,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
