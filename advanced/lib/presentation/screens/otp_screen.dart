import 'package:advanced/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import '../../constants/strings.dart';
import '../widgets/build_phone_virefication_bloc.dart';
import '../widgets/pre_text.dart';
import '../widgets/show_progress_indecator.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  OtpScreen({required this.phoneNumber, super.key});
  final String phoneNumber;
  late String otbCode;
  Widget buildpincode(BuildContext context) {
    return PinCodeTextField(
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
        otbCode = code;
        // print("Completed");
      },
      onChanged: (value) {
        // print(value);
        // setState(() {
        //   currentText = value;
        // });
      },
    );
  }

  void login(BuildContext context) {
    BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otbCode);
  }

  Widget otpButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          showProgressIndecator(context);
          login(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.purbel,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: const Text(
          'Verify',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
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
                phoneNumber: phoneNumber,
              ),
              const SizedBox(
                height: 80,
              ),
              buildpincode(context),
              const SizedBox(
                height: 30,
              ),
              otpButton(context),
            const  BuildPhoneVireficationBloc()
            ],
          ),
        ),
      ),
    );
  }
}
