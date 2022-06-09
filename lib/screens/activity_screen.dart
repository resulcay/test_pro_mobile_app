import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors.dart';
import '../models/day_model.dart';
import '../widgets/configs/size_config.dart';
import '../widgets/heading_widget.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int current = 4;
    return SizedBox(
      height: SizeConfig.blockSizeVertical * 90,
      width: double.infinity,
      child: Column(
        children: [_buildDateSection(current), _buildActivitySection()],
      ),
    );
  }

  Widget _buildActivitySection() {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: CustomColors.kBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              const HeadingWidget(
                text1: 'ACTIVITY',
                text2: 'Show All',
              ),
              _buildCard(
                  color: CustomColors.kYellowColor,
                  title: 'Running',
                  subtitle: '5km hard run',
                  time: '6:00 AM',
                  iconPath: 'assets/icons/running.svg'),
              _buildCard(
                  color: CustomColors.kCyanColor,
                  title: 'Cycling',
                  subtitle: '15km cycle riding',
                  time: '10:00 AM',
                  iconPath: 'assets/icons/bike.svg'),
              const HeadingWidget(
                text1: 'MEAL',
                text2: 'Show All',
              ),
              _buildCard(
                  color: CustomColors.kLightPinkColor,
                  title: 'Breakfast',
                  subtitle: 'Tea, Bread, Eggs',
                  time: '6:00 AM',
                  iconPath: 'assets/icons/coffee.svg'),
              _buildCard(
                  color: CustomColors.kPrimaryColor,
                  title: 'Lunch',
                  subtitle: 'Hamburger',
                  time: '6:00 AM',
                  iconPath: 'assets/icons/food.svg'),
              _buildCard(
                  color: CustomColors.kCyanColor,
                  title: 'Dinner',
                  subtitle: 'Chicken and Waffles',
                  time: '6:00 AM',
                  iconPath: 'assets/icons/food.svg'),
              _buildCard(
                  color: CustomColors.kCyanColor,
                  title: 'Dinner',
                  subtitle: 'Chicken and Waffles',
                  time: '2:00 PM',
                  iconPath: 'assets/icons/food.svg'),
              _buildCard(
                  color: CustomColors.kCyanColor,
                  title: 'Dinner',
                  subtitle: 'Chicken and Waffles',
                  time: '9:00 PM',
                  iconPath: 'assets/icons/food.svg'),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCard(
      {required Color color,
      required String title,
      required String subtitle,
      required String time,
      required String iconPath}) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 90,
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.2),
              child: SvgPicture.asset(
                iconPath,
                height: SizeConfig.blockSizeVertical * 5,
              ),
            ),
          ),
          const SizedBox(width: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 1),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          Text(
            time,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          )
        ],
      ),
    );
  }

  SizedBox _buildDateSection(int current) {
    return SizedBox(
      height: SizeConfig.blockSizeVertical * 10,
      child: ListView.builder(
          itemCount: days.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            int dayValue = int.parse(days[index].dayNumber);
            return Container(
              padding: const EdgeInsets.all(4.0),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                children: [
                  Expanded(flex: 1, child: Container()),
                  Text(
                    days[index].dayName,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: dayValue == current
                          ? CustomColors.kPrimaryColor
                          : dayValue > current
                              ? CustomColors.kLightColor
                              : Colors.black,
                    ),
                  ),
                  Expanded(flex: 2, child: Container()),
                  CircleAvatar(
                    backgroundColor: dayValue == current
                        ? CustomColors.kPrimaryColor
                        : Colors.transparent,
                    child: Text(
                      days[index].dayNumber,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: dayValue >= current
                            ? CustomColors.kLightColor
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
