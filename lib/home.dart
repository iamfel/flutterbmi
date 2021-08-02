import 'package:bodymassindex/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bodymassindex/icon_content.dart';
import 'package:bodymassindex/reusable_card.dart';
import 'package:bodymassindex/constants.dart';
import 'buttom_navigate.dart';
import 'package:bodymassindex/calculation.dart';

//CalculateBmi  cal = CalculateBmi(a, b);

enum Gender { male, female }

class BodyMassIndex extends StatefulWidget {
  @override
  _BodyMassIndexState createState() => _BodyMassIndexState();
}

class _BodyMassIndexState extends State<BodyMassIndex> {
  Color maleCard = kInActiveBackColor;
  Color feMaleCard = kInActiveBackColor;
  Color maleIcon = kDefaultIcon;
  Color feMaleIcon = kDefaultIcon;

  int height = 180;
  int weight = 60;

  int age = 20;

  Gender selectedGender;

//  void changeColor(Gender selectedGender) {
//    if (selectedGender == Gender.male) {
//      maleCard = activeBackColor;
//      feMaleCard = inActiveBackColor;
//      maleIcon = pickIcon;
//      feMaleIcon = defaultIcon;
////      iconColour = Colors.red;
//    } else if (selectedGender == Gender.female) {
//      feMaleCard = activeBackColor;
//      maleCard = inActiveBackColor;
//      feMaleIcon = pickIcon;
//      maleIcon = defaultIcon;
//    } else {
//      feMaleCard = inActiveBackColor;
//      maleCard = inActiveBackColor;
//    }
//  }

//  if (gender == 1) {
//  maleCard = activeBackColor;
//  } else {
//  maleCard = inActiveBackColor;
//  }
//
//  if (gender == 2) {
//  feMaleCard = activeBackColor;
//  } else {
//  feMaleCard = inActiveBackColor;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Body Mass Index"),
      ),
//      backgroundColor: Colors.black12,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  selectedGender == Gender.male
                      ? kActiveBackColor
                      : kInActiveBackColor,
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  cardChild: IconAndText(FontAwesomeIcons.male, "MALE",
                      selectedGender == Gender.male ? kPickIcon : kDefaultIcon),
                )),
                Expanded(
                  child: ReusableCard(
                    selectedGender == Gender.female
                        ? kActiveBackColor
                        : kInActiveBackColor,
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: IconAndText(
                        FontAwesomeIcons.female,
                        "FEMALE",
                        selectedGender == Gender.female
                            ? kPickIcon
                            : kDefaultIcon),
                  ),
                ),
              ],
            )),
            Expanded(
                child: ReusableCard(kActiveBackColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "HEIGHT",
                          style: kGenderTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kSliderValue,
                            ),
                            Text(
                              " cm",
                              style: kGenderTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x15EB1555),
                            activeTrackColor: Colors.white,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 24.0),
                          ),
                          child: Slider(
//                            activeColor: Colors.red,
                            inactiveColor: Colors.grey,
                            value: height.toDouble(),
                            min: 120.0,
                            max: 250.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ))),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  kActiveBackColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "WEIGHT",
                        style: kGenderTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kSliderValue,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIcon(FontAwesomeIcons.minus, () {
                            setState(() {
                              weight--;
                            });
                          }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIcon(FontAwesomeIcons.plus, () {
                            setState(() {
                              weight++;
                            });
                          }),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  kActiveBackColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "AGE",
                        style: kGenderTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kSliderValue,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIcon(FontAwesomeIcons.minus, () {
                            setState(() {
                              age--;
                            });
                          }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIcon(FontAwesomeIcons.plus, () {
                            setState(() {
                              age++;
                            });
                          })
                        ],
                      )
                    ],
                  ),
                )),
              ],
            )),
            BottomButton(() {
              CalculateBmi cal = CalculateBmi(height, weight);

//                Navigator.pushNamed(context, '/result');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(
                        cal.calculateBmiValue(),
                        cal.getBmiCompare(),
                        cal.getInterpretation(),
                        cal.calculateBmiValueInt()),
                  ));
            }, "CALCULATE BMI"),
          ],
        ),
      ),
//      floatingActionButton: Theme(
//        data: ThemeData(accentColor: Colors.purple, primaryColor: Colors.red),
//        child: FloatingActionButton(
//          onPressed: () {
//            print("cliked");
//          },
//          child: Icon(Icons.add),
//        ),
//      ),
    );
  }
}

class RoundIcon extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIcon(this.icon, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(
        icon,
//        size: 30.0,
        color: Colors.white,
      ),
      elevation: 8.0,
    );
  }
}
