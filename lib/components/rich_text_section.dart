import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextSection extends StatelessWidget {
  const RichTextSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text.rich(
          TextSpan(
            text: 'By continuing, you agree to our ',
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                  text: 'Terms of Service',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blueAccent,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // launch terms of service link here
                    }),
              TextSpan(
                text: ' and ',
                style: const TextStyle(fontSize: 16, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Privacy Notice',
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // launch privacy policy link here
                        }),
                  const TextSpan(
                    text: ' documantation.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
