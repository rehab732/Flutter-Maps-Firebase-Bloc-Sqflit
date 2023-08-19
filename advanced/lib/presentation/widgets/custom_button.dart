import 'package:advanced/constants/strings.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    required this.buttonName,
    super.key,
  });
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, otpScreen);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.purbel,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(
          buttonName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
