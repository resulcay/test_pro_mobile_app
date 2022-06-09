import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:test_pro_mobile_app/components/pagination.dart';
import 'package:test_pro_mobile_app/screens/home_screen.dart';
import 'package:test_pro_mobile_app/widgets/decorated_text_field.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../service/auth/auth_methods.dart';
import '../widgets/configs/size_config.dart';
import '../widgets/snack_bar.dart';

class PaginationStage2 extends StatefulWidget {
  const PaginationStage2(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.passRepeatController})
      : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passRepeatController;
  @override
  State<PaginationStage2> createState() => _PaginationStage2State();
}

class _PaginationStage2State extends State<PaginationStage2> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final TextEditingController nameController = TextEditingController();
  String chosenGender = "Female";
  int age = 25;
  int lenght = 170;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    void signUpUser() async {
      String res = await AuthMethods().signUpUser(
        email: widget.emailController.text,
        password: widget.passwordController.text,
        repeatedPassword: widget.passRepeatController.text,
        weight: weight,
        lenght: lenght,
        gender: chosenGender,
        name: nameController.text,
        age: age,
      );

      if (res != 'success') {
        showSnackBar(res, context);
      } else if (widget.passwordController.text !=
          widget.passRepeatController.text) {
        showSnackBar("Passwords must be matched!", context);
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    }

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (context) => const Pagination(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/icons/dumbell.svg',
          height: SizeConfig.blockSizeHorizontal * 10,
        ),
      ),
      body: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        pages: [
          PageViewModel(
            title: "Your Name",
            bodyWidget: Padding(
              padding: const EdgeInsets.symmetric(vertical: 120),
              child: DecoratedTextField(
                hintField: "Your Name",
                isObsecured: false,
                textFieldController: nameController,
              ),
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "What is Your Gender?",
            bodyWidget: Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        chosenGender = "Female";
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                blurStyle: BlurStyle.normal,
                                offset: Offset.zero,
                              ),
                            ],
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.female,
                            size: 110,
                            color: chosenGender == "Female"
                                ? Colors.pink
                                : Colors.pink.shade100,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Woman",
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        chosenGender = "Male";
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                blurStyle: BlurStyle.normal,
                                offset: Offset.zero,
                              ),
                            ],
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.male,
                            size: 110,
                            color: chosenGender == "Male"
                                ? Colors.blue
                                : Colors.blue.shade100,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Man",
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "How Old are You?",
            bodyWidget: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: NumberPicker(
                infiniteLoop: true,
                itemHeight: 80,
                minValue: 12,
                maxValue: 120,
                value: age,
                onChanged: (int value) {
                  setState(() {
                    age = value;
                  });
                },
              ),
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "How much is Your Lenght?",
            bodyWidget: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberPicker(
                    infiniteLoop: true,
                    itemHeight: 80,
                    minValue: 50,
                    maxValue: 240,
                    value: lenght,
                    onChanged: (int value) {
                      setState(() {
                        lenght = value;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "cm",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.blue),
                  )
                ],
              ),
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "How much is Your Weight?",
            bodyWidget: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberPicker(
                    infiniteLoop: true,
                    itemHeight: 80,
                    minValue: 40,
                    maxValue: 300,
                    value: weight,
                    onChanged: (int value) {
                      setState(() {
                        weight = value;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "kg",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.blue),
                  )
                ],
              ),
            ),
            decoration: pageDecoration,
            reverse: true,
          ),
        ],
        onDone: () => signUpUser(),
        skipOrBackFlex: 0,
        nextFlex: 0,
        next: Container(),
        done: Container(),
        globalFooter: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.blue.shade900),
              ),
              onPressed: () {
                signUpUser();
              },
              child: const Text(
                "Continue",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(5),
        controlsPadding: const EdgeInsets.fromLTRB(50.0, 4.0, 0.0, 4.0),
        dotsDecorator: const DotsDecorator(
          activeColor: kActiveDotColor,
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
    );
  }
}
