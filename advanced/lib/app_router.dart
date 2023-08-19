import 'package:advanced/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:advanced/presentation/screens/login.dart';
import 'package:advanced/presentation/screens/map.dart';
import 'package:advanced/presentation/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/strings.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;
  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mapScreen:
        return MaterialPageRoute(builder: (_) => const MapScreen());

      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            // create: (ctx)=>phoneAuthCubit!,
            value: phoneAuthCubit!,
            child: Login(),
          ),
        );
      case otpScreen:
        final String phoneNumber=settings.arguments.toString();
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            // create: (ctx)=>phoneAuthCubit!,
            value: phoneAuthCubit!,
            child:  OtpScreen(phoneNumber:phoneNumber),
          ),
        );
    }
    return null;
  }
}
