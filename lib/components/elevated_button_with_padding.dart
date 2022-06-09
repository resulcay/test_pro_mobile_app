import 'package:flutter/material.dart';

class ElevatedButtonWithPadding extends StatelessWidget {
  const ElevatedButtonWithPadding({
    Key? key,
    required this.function,
    required this.logoName,
    required this.destination,
  }) : super(key: key);

  final void Function()? function;
  final String logoName;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: function,
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              "assets/images/$logoName.png",
              scale: 2.0,
            ),
            const SizedBox(width: 20),
            Text(
              "Continue with $destination",
              style: Theme.of(context).textTheme.headline3?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
