
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../helpers/generate_country_flag.dart';

class CountryFlag extends StatelessWidget {
  const CountryFlag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 11,vertical: 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: MyColors.purbel)
      ),
      child: Text('${generateCountryFlag()} +02',
      style:const  TextStyle(
        letterSpacing: 2.0,
        fontSize: 18.0
      ),),
    );
  }
}
