import 'package:flutter/material.dart';
class ButtonButton extends StatelessWidget {
  ButtonButton({@required this.buttonText, @required this.onTap});
  final Function onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap : onTap,
      child: Container(
        child: Center(
          child: Text(buttonText,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        color:  Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 70.0,
      ),
    );
  }
}