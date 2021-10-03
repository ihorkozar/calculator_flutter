import 'package:calculator_flutter/gender_widget.dart';
import 'package:calculator_flutter/small_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const _bottomCardHeight = 80.0;
const _baseCardColor = Colors.deepPurple;
const _bottomCardColor = Colors.pink;

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: SmallCard(
                  color: _baseCardColor,
                  childCard: GenderWidget(
                    text: 'MALE',
                    iconData: FontAwesomeIcons.mars,
                  ),
                )),
                Expanded(
                  child: SmallCard(
                      color: _baseCardColor,
                      childCard: GenderWidget(
                        text: 'FEMALE',
                        iconData: FontAwesomeIcons.venus,
                      )),
                ),
              ],
            )),
            Expanded(child: SmallCard(color: _baseCardColor)),
            Expanded(
                child: Row(
              children: [
                Expanded(child: SmallCard(color: _baseCardColor)),
                Expanded(child: SmallCard(color: _baseCardColor)),
              ],
            )),
            Container(
              color: _bottomCardColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: _bottomCardHeight,
            )
          ],
        ));
  }
}
