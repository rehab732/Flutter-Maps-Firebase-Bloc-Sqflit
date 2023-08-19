import 'package:advanced/constants/colors.dart';
import 'package:flutter/material.dart';

class PreTexts extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  PreTexts({
    required this.text1,
    required this.text2,
    this.phoneNumber,
    super.key,
  });
  final String text1;
  final String text2;
  // ignore: prefer_typing_uninitialized_variables
  late final phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        // Text(
        //   text2,
        //   style: const TextStyle(color: Colors.black, fontSize: 18),
        // )
        Container(
          margin:const EdgeInsets.symmetric(horizontal: 2),
          child: RichText(
            text: TextSpan(
              text: text2,
              style:const TextStyle(color: Colors.black,fontSize: 18,height: 1.4),
              children: <TextSpan>[TextSpan(text: '$phoneNumber',style: TextStyle(color: MyColors.purbel))]
              ),
              ),
        )
      ],
    );
  }
}
