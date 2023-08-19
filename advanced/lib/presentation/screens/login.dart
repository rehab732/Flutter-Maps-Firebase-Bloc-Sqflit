import 'package:advanced/constants/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/country_flag.dart';
import '../widgets/next_button.dart';
import '../widgets/pre_text.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  late String phoneNumber;

  Widget buildtextfield() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.purbel),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextFormField(
        autofocus: true,
        style: const TextStyle(fontSize: 18, letterSpacing: 2.0),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        cursorColor: Colors.black,
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter your phone number";
          } else if (value.length < 11) {
            return 'to short phone number';
          }
          return null;
        },
        onSaved: (value) {
          phoneNumber = value!;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: UniqueKey(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
            child: Column(
              children: [
                const PreTexts(),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    const Expanded(flex: 1, child: CountryFlag()),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(flex: 2, child: buildtextfield()),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const NextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
