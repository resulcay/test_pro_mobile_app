import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app/screens/home_screen.dart';

import '../service/auth/auth_methods.dart';
import '../widgets/decorated_text_field.dart';
import '../widgets/snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    String res = await AuthMethods().loginUser(
        email: emailController.text, password: passwordController.text);

    if (res == 'success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      showSnackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(right: 35, left: 35, top: size.height * 0.07),
        child: Column(
          children: [
            DecoratedTextField(
                hintField: "E-mail",
                isObsecured: false,
                textFieldController: emailController),
            const SizedBox(
              height: 20,
            ),
            DecoratedTextField(
              hintField: "Password",
              isObsecured: true,
              textFieldController: passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    decorationStyle: TextDecorationStyle.solid),
              ),
            ),
            SizedBox(
              height: size.height * 0.27,
            ),
            SizedBox(
              height: 50,
              width: size.width * 0.85,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade900),
                ),
                onPressed: () {
                  loginUser();
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
