import 'package:advanced/constants/strings.dart';
import 'package:flutter/material.dart';
import '../widgets/build_next_button.dart';
import '../widgets/build_phone_number_submited_bloc.dart';
import '../widgets/build_text_field.dart';
import '../widgets/country_flag.dart';
import '../widgets/pre_text.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  late String phoneNumber;
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _phoneFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
            child: Column(
              children: [
                PreTexts(
                  text1: textone,
                  text2: textywo,
                  phoneNumber: ':',
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    const Expanded(flex: 1, child: CountryFlag()),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(flex: 2, child: BuildTextField(phone: phoneNumber)),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                 BuildNextButton(phoneFormKey: _phoneFormKey, phoneNumber: phoneNumber, context: context),
                BuildPhoneNumberSubmitedBloc(phoneNumber: phoneNumber),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
