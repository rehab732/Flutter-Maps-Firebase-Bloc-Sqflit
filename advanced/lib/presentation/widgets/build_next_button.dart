
import 'package:advanced/presentation/widgets/show_progress_indecator.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../helpers/register.dart';

class BuildNextButton extends StatelessWidget {
  const BuildNextButton({
    super.key,
    required GlobalKey<FormState> phoneFormKey,
    required this.phoneNumber,
    required this.context,
  }) : _phoneFormKey = phoneFormKey;

  final GlobalKey<FormState> _phoneFormKey;
  final String phoneNumber;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          showProgressIndecator(context);
          register(context,_phoneFormKey,phoneNumber);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.purbel,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: const Text(
          'Next',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
