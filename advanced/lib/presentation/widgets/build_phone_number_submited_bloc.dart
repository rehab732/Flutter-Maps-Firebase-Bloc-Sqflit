

import 'package:advanced/presentation/widgets/show_progress_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import '../../constants/strings.dart';

class BuildPhoneNumberSubmitedBloc extends StatelessWidget {
  const BuildPhoneNumberSubmitedBloc({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
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
}
