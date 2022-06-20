import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_pro_mobile_app/service/auth/providers/facebook_sign_in_provider.dart';
import 'package:test_pro_mobile_app/widgets/snack_bar.dart';

import '../components/elevated_button_with_padding.dart';
import '../components/landing_page_background.dart';
import '../components/pagination.dart';
import '../service/auth/providers/google_sign_in_provider.dart';
import 'home_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    Map? userData;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return const HomeScreen();
            } else if (snapshot.hasError) {
              return showSnackBar("Some error Occured! Reinstall App", context);
            } else {
              return Stack(
                children: [
                  LandingPageBackground(size: size),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/weight.png",
                        height: 200,
                      ),
                      Text(
                        "Hey! Welcome",
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          "Lorem ipsum dolor sit amet,  Nam a dictum neque. Vivamus in vulputate nunc. Sed eget tristique erat, vel molestie orci.",
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,

                      ),
                      ElevatedButtonWithPadding(
                        logoName: 'mail',
                        destination: 'Mail',
                        function: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Pagination(),
                            ),
                          );
                        },
                      ),
                      ElevatedButtonWithPadding(
                        logoName: 'google',
                        destination: 'Google',
                        function: () {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin();
                        },
                      ),
                      ElevatedButtonWithPadding(
                        logoName: 'facebook',
                        destination: 'Facebook',
                        function: () {
                          FacebookSignIn().facebookLogin();
                          setState(() {
                            userData = FacebookSignIn().userData;
                            print(userData);
                          });
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                        child: const Text("Continue without Signing up"),
                      ),
                    ],
                  ),
                ],
              );
            }
          }),
    );
  }
}
