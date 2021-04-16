import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'round_icon.dart';
import 'bmi_Calculation.dart';



enum Gender{
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
  int weight = 30;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
          children: [
            Expanded(
              child:ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                colour:selectedGender == Gender.male ? kactiveCardColour:kinactiveCardColour,
              cardChild: IconContent(icon: FontAwesomeIcons.mars,label: "MALE",),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour:selectedGender == Gender.female?kactiveCardColour:kinactiveCardColour,
              cardChild:IconContent(icon: FontAwesomeIcons.venus,label: "FEMALE",) ,
              ),
            ),
          ],  
          ),
          ),
          Expanded(
            child:ReusableCard(
                colour:kactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("HEIGHT",
                  style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [

                      Text(height.toString(),
                      style:kNumberTextStyle,
                      ),
                      Text("Cm",
                      style: klabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                    ),
                    child: Slider(
                      min: 120.0,
                      max: 220.0,
                      value: height.toDouble(),
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(colour: kactiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("WEIGHT",
                            style: klabelTextStyle,
                          ),
                          Text(weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.minus, onPressed:(){
                                setState(() {
                                  weight--;
                                });
                              },
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(icon: FontAwesomeIcons.plus, onPressed:(){
                                setState(() {
                                  weight++;
                                });
                              },
                              ),
                            ],
                          ),
                        ],
                      ),

                    ),
                  ),
                  Expanded(child: ReusableCard(colour: kactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE",
                        style: klabelTextStyle,
                        ),
                        Text(age.toString(),
                        style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed:(){
                            setState(() {
                              age--;
                            });
                            },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed:(){
                              setState(() {
                                age++;
                              });
                            },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ),

                ],
            ),
            ),
          BottomButton(
          buttonName:"CALCULATE",
            onTap:(){
            BmiCalculation calc = BmiCalculation(height: height,weight: weight);
              Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ResultPage(
                  bmiResult: calc.calculateBmi(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterPretation(),

                ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}





