import 'package:flutter/material.dart';

import '../utils/sizeconstants.dart';

class CustomPrimaryButton extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  final IconData buttonIcon;

  const CustomPrimaryButton(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      required this.buttonIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () {
          onPressed();
        },
        icon: Icon(buttonIcon, size: 18),
        label: Text(buttonText),
      ),
    );
  }
}
