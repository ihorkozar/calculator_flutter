import 'package:calculator_flutter/custom_widgets/bottom_section.dart';
import 'package:calculator_flutter/constants.dart';
import 'package:calculator_flutter/custom_widgets/small_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(
      {required this.index, required this.description, required this.text});

  String index;
  String text;
  String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kInactiveCardColor,
          title: Text('Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT:',
                style: kTitleTextStyle,
              ),
            )),
            Expanded(
                flex: 5,
                child: SmallCard(
                  color: kActiveCardColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: kResultTextStyle,
                      ),
                      Text(
                        index,
                        style: kTitleTextStyle,
                      ),
                      Text(
                        description,
                        style: kTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )),
            BottomBtn(
              onTap: () => Navigator.pop(context),
              title: 'RE-CALCULATE',
            ),
          ],
        ));
  }
}
