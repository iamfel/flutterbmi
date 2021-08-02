import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'constants.dart';

class CalculateBmi {
  final int height;
  final int weight;

  double _bmi;
  CalculateBmi(this.height, this.weight);

  String calculateBmiValue() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBmiCompare() {
    if (_bmi >= 25) {
      return "OVERWEIGHT";
    } else if (_bmi > 18.5) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "OVERWEIGHT";
    } else if (_bmi > 18.5) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  double calculateBmiValueInt() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi;
  }

//  void getStyle() {
//    var compareb;
//    if (calculateBmiValueInt() >= 25) {
//      compareb = 'a';
////      indicate = kColour;
//    } else if (calculateBmiValueInt() > 18.5) {
////      indicate = kResultText;
//      compareb = 'b';
//    } else {
////      indicate = kColour;
//      compareb = 'c';
//    }
//  }

//  void getStyle() {
//    if (_bmi >= 25) {
//      resultStyle = '' ;
//    } else if (_bmi > 18.5) {
//
//    } else {
//
//    }
//  }

}
