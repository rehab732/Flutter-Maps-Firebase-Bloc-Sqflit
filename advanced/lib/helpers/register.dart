  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_logic/cubit/phone_auth/phone_auth_cubit.dart';

Future<void> register(BuildContext context,GlobalKey<FormState> pho,String phon) async {
    if (!pho.currentState!.validate()) {
      Navigator.pop(context);
      return;
    } else {
      Navigator.pop(context);
      pho.currentState!.save();
      BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phon);
    }
  }
