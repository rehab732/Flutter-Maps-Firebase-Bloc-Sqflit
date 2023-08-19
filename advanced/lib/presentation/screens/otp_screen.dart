import 'package:advanced/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../constants/strings.dart';
import '../widgets/custom_button.dart';
import '../widgets/pre_text.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  Widget buildpincode(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        obscureText: false,
        autoFocus: true,
        keyboardType: TextInputType.number,
        cursorColor: MyColors.purbel,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          borderWidth: 1,
          activeColor: MyColors.purbel,
          inactiveColor: MyColors.purbel,
          inactiveFillColor: Colors.white,
          selectedColor: MyColors.purbel,
          selectedFillColor: Colors.white,
          activeFillColor: Colors.white,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (code) {
          // otpcode = code;
          // print("Completed");
        },
        onChanged: (value) {
          // print(value);
          // setState(() {
          //   currentText = value;
          // });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          child: Column(
            children: [
              PreTexts(
                text1: textthree,
                text2: textfour,
                phoneNumber: '01003445985',
              ),
              const SizedBox(
                height: 80,
              ),
              buildpincode(context),
            const  SizedBox(
                height: 30,
              ),
              const  NextButton(buttonName: 'Verify',
        
              ),
            ],
          ),
        ),
      ),
    );
  }
}
