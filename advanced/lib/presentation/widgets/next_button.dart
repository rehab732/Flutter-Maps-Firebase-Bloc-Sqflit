
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.purbel,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)),
          ),
          child:const Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          ),
    );
  }
}
