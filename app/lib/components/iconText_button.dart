import 'package:flutter/material.dart';
import '../constants.dart';

class IconTextButton extends StatelessWidget {
  IconTextButton({@required this.text, @required this.icon});
  final String text;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: <Widget>[
          Icon(
            icon,
            size: 20.0,
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            text,
            style: kLabelTextStyle,
          ),
        ],
      ),
    );
  }
}
