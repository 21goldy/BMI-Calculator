import 'package:bmi_calculator/screens/result.dart';
import '../components/constants.dart';
import '../components/reusable_widget.dart';
import '../components/child_card_material.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/brain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(children: <Widget>[
                Expanded(
                    child: ReusableCart(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveContainerColor
                      : kInactiveContainerColor,
                  cardChild: CardChildMaterial(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                  ),
                )),
                Expanded(
                    child: ReusableCart(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveContainerColor
                      : kInactiveContainerColor,
                  cardChild: CardChildMaterial(
                    icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                  ),
                )),
              ]),
            ),
            Expanded(
              child: ReusableCart(
                colour: kActiveContainerColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kTextTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kTextTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: kSliderInactiveColor,
                          activeTrackColor: Colors.white,
                          overlayColor: kOverlayColor,
                          thumbColor: kSliderActiveColor,
                          trackHeight: 0.3,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 12),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 25)),
                      child: Slider(
                        value: height.toDouble(),
                        min: kMinHeight,
                        max: kMaxHeight,
                        onChanged: (double sliderValue) {
                          setState(() {
                            height = sliderValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(children: <Widget>[
                Expanded(
                    child: ReusableCart(
                  colour: kActiveContainerColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style: kTextTextStyle),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(
                            onTouch: () {
                              setState(() {
                                weight += 1;
                              });
                            },
                            icon: Icons.add,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          RoundButton(
                            onTouch: () {
                              setState(() {
                                weight -= 1;
                              });
                            },
                            icon: Icons.remove,
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCart(
                  colour: kActiveContainerColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE', style: kTextTextStyle),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(
                            onTouch: () {
                              setState(() {
                                age += 1;
                              });
                            },
                            icon: Icons.add,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          RoundButton(
                            onTouch: () {
                              setState(() {
                                age -= 1;
                              });
                            },
                            icon: Icons.remove,
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ]),
            ),
            CalculateButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}
