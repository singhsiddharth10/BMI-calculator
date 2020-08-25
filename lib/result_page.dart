import 'calculater.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'Button.dart';
class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiInterpretation,@required this.bmiResult, @required this.bmiText});
  final String bmiResult;
  final String bmiText;
  final String bmiInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),

              alignment: Alignment.bottomLeft,
              child: Text('YOUR RESULT',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ),
          Expanded(
            flex: 5,
            child: ResuableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiText.toUpperCase(),
                    style: TextStyle(
                      color: Color(0xFF24DB76),
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize: 70.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                    bmiInterpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ButtonButton(
            onTap: (){
              Navigator.pop(context);
            },
            buttonText: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
