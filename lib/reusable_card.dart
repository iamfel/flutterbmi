import 'package:flutter/material.dart';

const Widget correctIcon = Icon(
  Icons.check_box,
  color: Colors.yellow,
);

class ReusableCard extends StatelessWidget {
  ReusableCard(this.colour, {this.cardChild, this.onPress});
  final Color colour;

  final Widget cardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
