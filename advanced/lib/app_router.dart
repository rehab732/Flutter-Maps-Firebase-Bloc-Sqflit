import 'package:advanced/presentation/screens/login.dart';
import 'package:flutter/material.dart';

 class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      return MaterialPageRoute(
        builder:(_)=> const Login(),

         );
    }
    return null;
  }
}
