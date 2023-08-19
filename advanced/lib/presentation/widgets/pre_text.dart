
import 'package:flutter/material.dart';

class PreTexts extends StatelessWidget {
  const PreTexts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'What is Your Phone Number ? ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
        
          ),
        ),
          SizedBox(height: 30,),
        Text('Please Enter Your Phone Number To Verify Your Account :',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18
        ),
        )
      ],
    );
  }
}
