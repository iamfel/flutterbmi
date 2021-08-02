import 'package:flutter/material.dart';
import 'package:bodymassindex/constants.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String genderText;
  final Color iconColour;

  IconAndText(this.icon, this.genderText, this.iconColour);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: iconColour,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          genderText,
          style: kGenderTextStyle,
        )
      ],
    );
  }
}
