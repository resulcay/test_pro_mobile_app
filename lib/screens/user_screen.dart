import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app/screens/landing_screen.dart';

import '../service/auth/auth_methods.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 60,
              backgroundImage: NetworkImage(user?.photoURL ??
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQut6F75cQgY5YZXdaBOOjWcGibifvlqv3BDg&usqp=CAU"),
            ),
            Text(
              "Username : ${user?.displayName ?? "defaultUsername"}",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              "E-mail : ${user?.email ?? "default@gmail.com"}",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              "User ID : ${user?.uid ?? "defaul ID"}",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.blue.shade900),
              ),
              onPressed: () {
                AuthMethods().signOut();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LandingScreen(),
                  ),
                );
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
