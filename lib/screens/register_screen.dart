import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app/components/pagination_tier_2.dart';

import '../components/rich_text_section.dart';
import '../widgets/decorated_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passRepeatController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    passRepeatController.dispose();
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
              textFieldController: emailController,
            ),
            const SizedBox(
              height: 30,
            ),
            DecoratedTextField(
                hintField: "Password",
                isObsecured: true,
                textFieldController: passwordController),
            const SizedBox(
              height: 30,
            ),
            DecoratedTextField(
                hintField: "Re-write Password",
                isObsecured: true,
                textFieldController: passRepeatController),
            const SizedBox(
              height: 20,
            ),
            const RichTextSection(),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: size.width * 0.85,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade900),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaginationStage2(
                        emailController: emailController,
                        passwordController: passwordController,
                        passRepeatController: passRepeatController,
                      ),
                    ),
                  );
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
