import 'package:bodymassindex/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:bodymassindex/buttom_navigate.dart';

class Result extends StatelessWidget {
  final String bmiValue;

  final String compare;
  final String interpretation;

  final double intValue;
  Result(this.bmiValue, this.compare, this.interpretation, this.intValue);

  TextStyle indicate;

  TextStyle getStyle() {
    if (intValue >= 25) {
//      compareb = 'a';
      indicate = kColour;
    } else if (intValue > 18.5) {
      indicate = kResultText;
//      compareb = 'b';
    } else {
      indicate = kColour;
//      compareb = 'c';
    }
    return indicate;
  }

//compareb = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: Text("Result"),
//        ),

        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                "result",
                style: kTitleStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              kActiveBackColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    compare,
                    style: getStyle(),
                  ),
                  Text(
                    bmiValue,
                    style: kBmiText,
                  ),
                  Text(
                    interpretation,
                    style: kResultBody,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(() {
//                Navigator.pushNamed(context, '/result');
            Navigator.pop(context);
          }, "RE-CALCULATE BMI"),
        ],
      ),
    ));
  }
}

String compareb;
void getStyle(int intValue) {
  if (intValue >= 25) {
    compareb = 'a';
//      indicate = kColour;
  } else if (intValue > 18.5) {
//      indicate = kResultText;
    compareb = 'b';
  } else {
//      indicate = kColour;
    compareb = 'c';
  }
}
