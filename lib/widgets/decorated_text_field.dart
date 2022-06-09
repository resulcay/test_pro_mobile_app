import 'package:flutter/material.dart';

class DecoratedTextField extends StatefulWidget {
  const DecoratedTextField(
      {Key? key,
      required this.hintField,
      required this.isObsecured,
      required this.textFieldController})
      : super(key: key);

  final TextEditingController textFieldController;

  final String hintField;
  final bool isObsecured;

  @override
  State<DecoratedTextField> createState() => _DecoratedTextFieldState();
}

class _DecoratedTextFieldState extends State<DecoratedTextField> {
  bool checkIfClicked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.hintField),
        const SizedBox(
          height: 5,
        ),
        TextField(
          textInputAction: TextInputAction.next,
          controller: widget.textFieldController,
          obscureText: widget.isObsecured && checkIfClicked == false,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blueAccent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black),
            ),
            hintStyle: const TextStyle(color: Colors.black),
            suffixIcon: widget.isObsecured == true
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        checkIfClicked = !checkIfClicked;
                      });
                    },
                    icon: checkIfClicked == true
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off))
                : null,
          ),
        ),
      ],
    );
  }
}
