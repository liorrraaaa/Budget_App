import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RoundIconButtonTwo extends StatelessWidget {
  RoundIconButtonTwo({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon, size: 30.0, color: Colors.white),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 60.0,
        height: 60.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.blueGrey,
    );
  }
}
