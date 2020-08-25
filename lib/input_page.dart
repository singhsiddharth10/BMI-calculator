import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'Button.dart';
import 'roundButton.dart';
import 'calculater.dart';
enum gender{male,female}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ResuableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = gender.male;
                    });
                  },
                colour : selectedGender == gender.male ? activeCardColor : inActiveCardColor,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.mars,
                  label: 'MALE',
                ),
                ),
              ),
              Expanded(child:
              ResuableCard(
                onPress: (){
                  setState(() {
                    selectedGender = gender.female;
                  });
                },
              colour : selectedGender == gender.female ? activeCardColor : inActiveCardColor,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.venus,
                  label: 'FEMALE',
                ),
                ),
              ),
            ],
          ),),
          Expanded(child: ResuableCard(
            colour : activeCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: labelTextStyle,
                ),
                SizedBox(
                  height: 2.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: numberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: labelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor:Color (0x29EB1555),
                    inactiveTrackColor: Color(0xFFBDBE98),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
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
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ResuableCard(
                  colour : activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: labelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: numberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundShapeButton(
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                          iconData: FontAwesomeIcons.plus,
                        ),
                        SizedBox(
                          width:
                          10.0,
                        ),
                        RoundShapeButton(
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                          iconData: FontAwesomeIcons.minus,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ),
              Expanded(child: ResuableCard(
                  colour : activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: labelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: numberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundShapeButton(
                          onPressed: (){
                            setState(() {
                              age++;
                              if(age > 100)
                                age = 100;
                            });
                          },
                          iconData: FontAwesomeIcons.plus,
                        ),
                        SizedBox(
                          width:
                          10.0,
                        ),
                        RoundShapeButton(
                          onPressed: (){
                            setState(() {
                              age--;
                              if(age < 0 )
                                age = 0;

                            });
                          },
                          iconData: FontAwesomeIcons.minus,
                        ),
                      ],
                    )
                  ],
                ),

              ),
              ),
            ],
          ),
          ),
          ButtonButton(onTap: (){
            CalculatorBrain cal = CalculatorBrain(height: height,weight: weight);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ResultPage(
              bmiResult: cal.calculateBMI(),
              bmiText: cal.getResult(),
              bmiInterpretation: cal.getInterpretation(),
            )));
          },
          buttonText: 'CALCULATE',)
            ],
          ));
    }
}


