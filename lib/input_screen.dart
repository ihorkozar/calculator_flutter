import 'package:calculator_flutter/gender_widget.dart';
import 'package:calculator_flutter/small_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator_flutter/constants.dart';

enum Gender {
  male,
  female,
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender selectedGender = Gender.male;
  double height = 190.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kInactiveCardColor,
          title: Text('Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: SmallCard(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  childCard: GenderWidget(
                    text: 'MALE',
                    iconData: FontAwesomeIcons.mars,
                  ),
                )),
                Expanded(
                  child: SmallCard(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      childCard: GenderWidget(
                        text: 'FEMALE',
                        iconData: FontAwesomeIcons.venus,
                      )),
                ),
              ],
            )),
            Expanded(
                child: SmallCard(
              color: kActiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      activeColor: kBottomCardColor,
                      inactiveColor: kInactiveCardColor,
                      value: height,
                      min: 140.0,
                      max: 240.0,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round().toDouble();
                        });
                      },
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(child: SmallCard(color: kInactiveCardColor)),
                Expanded(child: SmallCard(color: kInactiveCardColor)),
              ],
            )),
            Container(
              color: kBottomCardColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomCardHeight,
            )
          ],
        ));
  }
}
