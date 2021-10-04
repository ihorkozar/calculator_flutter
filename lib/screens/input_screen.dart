import 'package:calculator_flutter/calculator_logic.dart';
import 'package:calculator_flutter/custom_widgets/bottom_section.dart';
import 'package:calculator_flutter/custom_widgets/gender_widget.dart';
import 'package:calculator_flutter/screens/results_screen.dart';
import 'package:calculator_flutter/custom_widgets/small_card.dart';
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
  int weight = 80;
  int edge = 20;

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
                Expanded(
                    child: SmallCard(
                  color: kInactiveCardColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGH',
                        style: kTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            backgroundColor: kActiveCardColor,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            backgroundColor: kActiveCardColor,
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                  child: SmallCard(
                    color: kInactiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ADGE',
                          style: kTextStyle,
                        ),
                        Text(
                          edge.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  edge++;
                                });
                              },
                              backgroundColor: kActiveCardColor,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  edge--;
                                });
                              },
                              backgroundColor: kActiveCardColor,
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            BottomBtn(
              onTap:() { 
                CalculatorLogic cl = CalculatorLogic(height: height.toInt(), weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsScreen(
                  index: cl.calculate(),
                  description: cl.getDescription(),
                  text: cl.getResult(),
                )));
              },
              title: 'Calculate',
            )
          ],
        ));
  }
}
