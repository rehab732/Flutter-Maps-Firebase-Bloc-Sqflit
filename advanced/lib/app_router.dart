import 'package:advanced/presentation/screens/login.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/login';
  
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const Login();
        },
      ),
    ],
  );
}