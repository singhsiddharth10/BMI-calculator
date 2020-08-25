import 'package:flutter/material.dart';
class RoundShapeButton extends StatelessWidget {
  RoundShapeButton({@required this.iconData, @required this.onPressed});
  final IconData iconData;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      child: Icon(
        iconData,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),

    );
  }
}




