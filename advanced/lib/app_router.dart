import 'package:advanced/presentation/screens/login.dart';
import 'package:advanced/presentation/screens/otp_screen.dart';
import 'package:flutter/material.dart';

import 'constants/strings.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
      case otpScreen:
        return MaterialPageRoute(
          builder: (_) => const OtpScreen(),
        );
    }
    return null;
  }
}
