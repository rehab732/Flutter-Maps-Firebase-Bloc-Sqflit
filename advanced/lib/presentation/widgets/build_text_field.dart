
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

// ignore: must_be_immutable
class BuildTextField extends StatelessWidget {
   BuildTextField({
    super.key,
    required this.phone,
  });

  late String phone;

  @override
  Widget build(BuildContext context) {
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
          phone = value!;
        },
      ),
    );
  }
}


