import 'package:advanced/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:advanced/constants/colors.dart';
import 'package:advanced/constants/strings.dart';
import 'package:advanced/presentation/widgets/show_progress_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/country_flag.dart';
import '../widgets/pre_text.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  late String phoneNumber;
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();

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

  Future<void> register(BuildContext context) async {
    if (!_phoneFormKey.currentState!.validate()) {
      Navigator.pop(context);
      return;
    } else {
      Navigator.pop(context);
      _phoneFormKey.currentState!.save();
      BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phoneNumber);
    }
  }

  Widget buildNextButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          showProgressIndecator(context);
          register(context);
          // Navigator.pushNamed(context, otpScreen);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.purbel,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: const Text(
          'Next',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildPhoneNumberSubmitedBloc() {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (prev, curr) {
        return prev != curr;
      },
      listener: (context, state) {
        if (state is Loading) {
          showProgressIndecator(context);
        }
        if (state is PhoneNumberSubmited) {
          Navigator.pop(context);
          Navigator.of(context).pushNamed(otpScreen, arguments: phoneNumber);
        }
        if (state is ErrorOccured) {
          Navigator.pop(context);
          String err = (state).errormessage;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(err),
            backgroundColor: Colors.black,
            duration: const Duration(seconds: 3),
          ));
        }
      },
      child: Container(),
    );
  }

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
                    Expanded(flex: 2, child: buildtextfield()),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                 buildNextButton(context),
                buildPhoneNumberSubmitedBloc(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


