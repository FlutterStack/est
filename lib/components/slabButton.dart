import 'package:flutter/material.dart';

class SlabButton extends StatelessWidget {
  SlabButton(
      {@required this.icon, @required this.iText, @required this.onPressed});
  final IconData icon;
  final String iText;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Row(
        children: <Widget>[
          Icon(icon),
          Text(iText),
        ],
      ),
      onPressed: onPressed,
      elevation: 5.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
