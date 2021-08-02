import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bodymassindex/result_page.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;

  final String action;

  BottomButton(this.onTap, this.action);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFEB1555),
        ),
        child: Center(
          child: Text(
            action,
            style: kCalculateStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
