import 'package:advanced/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:advanced/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocProvider<PhoneAuthCubit>(
          create: (context) => phoneAuthCubit,
          child: ElevatedButton(
              onPressed: () async {
                await phoneAuthCubit.logOut();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushReplacementNamed(loginScreen);
              },
              child:const Text("Maps Screen")),
        ),
      ],
    );
  }
}
